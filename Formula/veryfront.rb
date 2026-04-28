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
  version "0.1.304"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.304/veryfront-macos-arm64"
      sha256 "5d2ad69b8b751a20179d58a33ed5dc43f5c9006f67b8ad5d8e754fabcb4bcbd6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.304/veryfront-macos-x64"
      sha256 "ac877d686e0d35a3a45d52751656c3aaa247def70c6f3ad86430e8de0726e215"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.304/veryfront-linux-arm64"
      sha256 "371cf05a83d3eb3939bad2f1c504fbb050e2a69d9101d2f3672a961f4ca3d0c5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.304/veryfront-linux-x64"
      sha256 "013c3f2fd02fc74f05e659c5e59b70ee1aae7262655986ba99f520b83528ef3e"
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
