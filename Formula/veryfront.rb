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
  version "0.1.647"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.647/veryfront-macos-arm64"
      sha256 "f3c7bcbf584d4d43cf6e3821f0d4544a1b6d7ee3697c62115077e67f20cd28eb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.647/veryfront-macos-x64"
      sha256 "f7bd870fa7ff997b14594925835c5d5066b3eeeed4d551ab2eab7b873d01e0bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.647/veryfront-linux-arm64"
      sha256 "4c790a6eb5ebbfa5b6130796262dd608abc595c240c665aea97f81c80ec9ea73"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.647/veryfront-linux-x64"
      sha256 "9339d3b379561578b7c2648e9f1e252be121f87b679b7ce84c6a1f1741e9f9fb"
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
