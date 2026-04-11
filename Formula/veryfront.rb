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
  version "0.1.186"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.186/veryfront-macos-arm64"
      sha256 "bcd7f36e84b403196a62ed416e9a64e5593441a6f7f45778b967b4d26da5bfd9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.186/veryfront-macos-x64"
      sha256 "5ce96bfc5567713ae802a079f4620679cd0c9fd6495e3ef0ff1cb1f388608afa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.186/veryfront-linux-arm64"
      sha256 "f3ee03bd45fbaba4100b86ca37fef376921f8f0361d4e9585c15ec6cc235cf45"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.186/veryfront-linux-x64"
      sha256 "c16261b59a33465274f31b6057c9dbf006c1f4a00a4fdc63daf22e88bb5ab6c5"
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
