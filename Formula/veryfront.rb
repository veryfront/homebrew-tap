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
  version "0.1.103"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.103/veryfront-macos-arm64"
      sha256 "95adaf3247b1a70c6d0e952164e4cdc0598e4f31a6214311790353f73b98315c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.103/veryfront-macos-x64"
      sha256 "904ef264142e3c49ecdcd49398d20b5ac160124aea855b4f2f7df4159dd1a47f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.103/veryfront-linux-arm64"
      sha256 "ff239a32be6f46989da3b830ffb6470b47464858ad29a87ce6892f18174fb586"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.103/veryfront-linux-x64"
      sha256 "7288ebf2eab91bc19076d77fd6489d30090eb3db67cc079995662132484b8fe2"
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
