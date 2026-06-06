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
  version "0.1.678"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.678/veryfront-macos-arm64"
      sha256 "cf0a82f6047abab72c45082f0887d5b0ef75ac14ddb829c0a9b6fa31538fb0fa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.678/veryfront-macos-x64"
      sha256 "79de7d37e9402e98049f361e236ab8edaeafec2712ee3105aa5635fd94d29125"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.678/veryfront-linux-arm64"
      sha256 "47d653eb91945d9e2dc421b7bbe3f85e5ba6285a14d6742c61a98466ee00df0c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.678/veryfront-linux-x64"
      sha256 "3af433c99d5417f57623518ff84fb2b54f19b69238c93b9857ba345df93a6725"
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
