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
  version "0.1.967"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.967/veryfront-macos-arm64"
      sha256 "ef9150d942034b2e1155a4c9887054574cff3067cc9b72479e25ecdf03477070"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.967/veryfront-macos-x64"
      sha256 "195c31226009f4b70ac33843a8d4b95ea67acdef27663bfc042401e02ee53ea7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.967/veryfront-linux-arm64"
      sha256 "7f52c7d8ab83c543fa1ae017ffb2ba002804a0b67bf33ca7a0953b07f5b298d1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.967/veryfront-linux-x64"
      sha256 "faff450c194865676a54623843ca0b96dd5b81f8a95a431a1566fac6d5e0475a"
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
