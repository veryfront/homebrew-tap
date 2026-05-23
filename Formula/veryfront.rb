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
  version "0.1.582"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.582/veryfront-macos-arm64"
      sha256 "d02807ada0033f7b8a3ecbb981ec5f5c02a603edb518905889af349a9e4079ad"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.582/veryfront-macos-x64"
      sha256 "69aa8cbaf1ba2bdfb67dd6655287726e49bc6d02339637c3ba3247844ba59588"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.582/veryfront-linux-arm64"
      sha256 "e2f08a19c6438c50a43a4fa2bf8fcd942a92d049aa36077217315a64b4b633c5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.582/veryfront-linux-x64"
      sha256 "4fe674502aaa73d29d87db3a2e84d1920f89692cdf26ab742a6dff2e01789433"
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
