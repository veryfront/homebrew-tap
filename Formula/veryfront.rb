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
  version "0.1.581"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.581/veryfront-macos-arm64"
      sha256 "d137858138492b7934411bee9914523ff8ce800a75d6b464f5bbceeb0d37758a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.581/veryfront-macos-x64"
      sha256 "6f7a603a96e75c39a9c363d6a5513d1e954388d33f123c62fb527420d6ca3d7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.581/veryfront-linux-arm64"
      sha256 "4d6f2aa130c917bc0e75a52b12ef99d373689de913937d8ebc7c5dd418926556"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.581/veryfront-linux-x64"
      sha256 "fd4c6e21d7bd6967709eff56a7cf9e1828ab8bbd5ae62fbc71824dffa9aace93"
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
