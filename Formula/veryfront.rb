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
  version "0.1.1244"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1244/veryfront-macos-arm64"
      sha256 "7c3e65c1f940f1781caa80ac4ce9d63e018184c4e35d1d02b41421df3c4216e9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1244/veryfront-macos-x64"
      sha256 "e3945e3cd88b439bd1e1c7876e6cd4c7864d9e9cdc3effb34a5a7bed7f9f68a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1244/veryfront-linux-arm64"
      sha256 "ed6c514d792438b3ea991e6c37bf5c36d01d8f4d46c326897c464948bd22f77a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1244/veryfront-linux-x64"
      sha256 "6450fd53bf8a7db4846fb6671ee934b5e70e461646f902e9363782306be7e29e"
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
