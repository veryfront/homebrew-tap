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
  version "0.1.620"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.620/veryfront-macos-arm64"
      sha256 "09ba8ee33a56059d384674fab8941283626653adb3d79d602d74fd3731351f5b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.620/veryfront-macos-x64"
      sha256 "1b7c119adb1e386f226c87ff7914d3f7160c6aa565e369d8bc47e5dc367e1534"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.620/veryfront-linux-arm64"
      sha256 "eef9aeb28a7e3513182f483b6bea60d028ab3ebe5b1ba1a6601f88a5b46de2a4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.620/veryfront-linux-x64"
      sha256 "dd136095431d5e772a01b0053a95855b04e59c322eb9afdbeaa6009a5c8d38be"
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
