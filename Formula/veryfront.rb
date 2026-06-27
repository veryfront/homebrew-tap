# Homebrew formula for Veryfront CLI
#
# To use this formula:
#   1. Create a tap: veryfront/homebrew-tap
#   2. Copy this file to: homebrew-tap/Formula/veryfront.rb
#   3. Users can then: brew install veryfront/tap/veryfront
#
# Or submit to homebrew-core for: brew install veryfront

class Veryfront < Formula
  desc "Zero-config React meta-framework for AI-native applications"
  homepage "https://veryfront.com"
  license "MIT"
  version "0.1.946"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.946/veryfront-macos-arm64"
      sha256 "72ab00be6b22fa442c54d884cc4826008127830394e821ccddcd35d20d58cebb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.946/veryfront-macos-x64"
      sha256 "7963e91276ed33bd533e1c9384e663b9570914fae7a1e2abfc4e9870fa925dbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.946/veryfront-linux-arm64"
      sha256 "39bed916dea27500868d7ad3006fe56d75d6daafe33a17f55dbc7c33e3980d2f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.946/veryfront-linux-x64"
      sha256 "948ebd654116c3379ca043193cb9546d8d5e2e06669ac0cea1e48510ffc673a9"
    end
  end

  def install
    binary_name = "veryfront"
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "veryfront-macos-arm64" : "veryfront-macos-x64"
    elsif OS.linux?
      binary_name = Hardware::CPU.arm? ? "veryfront-linux-arm64" : "veryfront-linux-x64"
    end

    # The downloaded file is already the binary
    bin.install Dir["veryfront*"].first => "veryfront"
  end

  test do
    assert_match "veryfront", shell_output("#{bin}/veryfront --version")
  end
end
