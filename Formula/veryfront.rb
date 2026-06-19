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
  version "0.1.867"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.867/veryfront-macos-arm64"
      sha256 "fa82531467484f669c7648b4a201fb26c87dc62e76cffdb41681e26a9c17e7aa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.867/veryfront-macos-x64"
      sha256 "a8ac156eeb9ab3c19ef74bdab91bd8708e9c274c6bf7e05510c6c9fab0ada565"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.867/veryfront-linux-arm64"
      sha256 "72844fd5568438330e95308eaf385b16bb0e256eee423db3a37422961204545d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.867/veryfront-linux-x64"
      sha256 "7689c92d5055380ede25cee0f2839ef339eed41935e1964a10aba6afb4946cdc"
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
