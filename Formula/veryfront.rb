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
  version "0.1.667"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.667/veryfront-macos-arm64"
      sha256 "90e3e403114da7a7b0a95b5258131275d58593fe1c701ab10c9bd52076232850"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.667/veryfront-macos-x64"
      sha256 "02e0d43527e4349e4b1787049b4b88dc3358c1cfa62cf021bdf419a9d814d126"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.667/veryfront-linux-arm64"
      sha256 "8bdff0fb39dcfe2b5b42ad3b4e035e685d7ea93d57d0eeedeb6c8bbbe974a245"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.667/veryfront-linux-x64"
      sha256 "a29ef3e5883f347674c6a127dd06b329586d0f994eb4f0dbff2d8dbb0ec4c8f2"
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
