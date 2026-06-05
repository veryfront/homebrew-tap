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
  version "0.1.674"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.674/veryfront-macos-arm64"
      sha256 "69a9f615693cf3fda2caf57a4421907a7619876883a5a956225793e1ef98e15a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.674/veryfront-macos-x64"
      sha256 "9c9f98960e1974360956479338eb72e6661d2ab1b023fbcdc21a007f0545d8a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.674/veryfront-linux-arm64"
      sha256 "e91f69034328a324f3c2d17f56365298fcb7e96b38a3d20ce6272f0fc0c9ecda"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.674/veryfront-linux-x64"
      sha256 "7961c414acd799eae1651fe9952ea2564c28b330463b24c7a375e178befe1cac"
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
