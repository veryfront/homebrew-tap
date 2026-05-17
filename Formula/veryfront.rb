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
  version "0.1.543"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.543/veryfront-macos-arm64"
      sha256 "37fa99cd484cc24283c33cb38d7f101d3d3edf452af781a9793591f69f3ebcd9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.543/veryfront-macos-x64"
      sha256 "624e08def8d27ea95564be65783358b9eb53f0008b6a77d5a0f03eaafcdfda68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.543/veryfront-linux-arm64"
      sha256 "96b33d752cd14c9f2e32d34232674c85d489506c456b221dcf8fe7b97316ac9e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.543/veryfront-linux-x64"
      sha256 "7d3397102cf950ee7ff0da4fe79994700a3d4898d7a7f18c7a5662f635f96acc"
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
