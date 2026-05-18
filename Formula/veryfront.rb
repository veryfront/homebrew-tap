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
  version "0.1.553"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.553/veryfront-macos-arm64"
      sha256 "9913d5b549f2f8c65f9bbf2fef3b57b338fd6a8460923477c85f91096f202735"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.553/veryfront-macos-x64"
      sha256 "8c9b1eaf69d9961027b8f5838a4b3d841a27687de83a757a98bc26d3ab3bda56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.553/veryfront-linux-arm64"
      sha256 "fb3afe7784c3671bd3d58e16a29ff74df709b68239eaa4b2f98d0dc972bbd2b6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.553/veryfront-linux-x64"
      sha256 "9fcd78f97c058debcfdb87665997fe01dbb15c970a0cb79b858363462141b561"
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
