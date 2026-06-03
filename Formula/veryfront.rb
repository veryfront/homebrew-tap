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
  version "0.1.645"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.645/veryfront-macos-arm64"
      sha256 "f5ef6eed7d30155dff087e2c6da3b08bfe3fddac6f1d2c6c5d4f3c400d0c7d62"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.645/veryfront-macos-x64"
      sha256 "e23d4d59e0c1cef58bb558642d10b7fb7ce8d6f0789ac6b9ffd71f7b51accccf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.645/veryfront-linux-arm64"
      sha256 "f7f5d789715b02d1c676e0be321177ed88888eb58a1b99b6bae5ccc9cfc9fa66"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.645/veryfront-linux-x64"
      sha256 "41412b6ca32cef83bc761861c5061225246e7bd98fc5de7f62d5cd70e28f2145"
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
