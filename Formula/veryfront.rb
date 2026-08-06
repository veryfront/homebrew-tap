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
  version "0.1.1207"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1207/veryfront-macos-arm64"
      sha256 "52f43459b937e62ff2dbcb3c27244eeab7f24409962009750abbdb700782cd07"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1207/veryfront-macos-x64"
      sha256 "81597830a6e4e3353545e5c8f9b188451c1276dcb0d240d72d8effc0d0114d9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1207/veryfront-linux-arm64"
      sha256 "080dc0ea253780f2c908660d74d7f2098318349c05d868a3098090877ff203ef"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1207/veryfront-linux-x64"
      sha256 "0c7b83c75067a79e512c5ab044d8cea988a08ee95ce706138c8865322a5ed4b9"
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
