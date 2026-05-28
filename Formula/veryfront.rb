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
  version "0.1.607"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.607/veryfront-macos-arm64"
      sha256 "74d4dbbfccb5af8b077bc35159d3e13e68f2f42be9c307c9444e6c8dc253abdb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.607/veryfront-macos-x64"
      sha256 "659a153ed21478a7074d30d696dea545ae91a88a6b6c68841322148a000410f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.607/veryfront-linux-arm64"
      sha256 "e5ed2519b88a7e4da72c009f7d2f3af5a99ed9542c951a4b2445094673abcbc7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.607/veryfront-linux-x64"
      sha256 "a648a5f34ecd1b882100251b0a491e505ed1ed3f8da51c83b1fd6af1ce8d31ad"
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
