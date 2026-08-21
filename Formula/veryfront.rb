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
  version "0.1.1247"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1247/veryfront-macos-arm64"
      sha256 "c76c82839bf007c132091f249a347e75641e6ebc10dbd53b800ef4741aaf8786"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1247/veryfront-macos-x64"
      sha256 "5d5a220900a25893bf2ccbf16a9f9f4f06061a5d383148e5f5866a22de511f09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1247/veryfront-linux-arm64"
      sha256 "1243a11a0c06f5388ff272fcec97a13ac55c570c7f414ccadb9c0b5b2d325b9e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1247/veryfront-linux-x64"
      sha256 "67600919369ad57e1472a2007242dfa8bc8a05eb8695041e3c3fa17a1d22d143"
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
