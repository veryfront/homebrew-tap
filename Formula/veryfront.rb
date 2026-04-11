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
  version "0.1.188"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.188/veryfront-macos-arm64"
      sha256 "3339a2a5f9d7fe5737cf61e4d024ed81090e629d58d310e4d788153aeb84485d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.188/veryfront-macos-x64"
      sha256 "87be468dee62d96ffcdb2b29cf0616e7ed9e8c4332c9e8a826c254d82fa5e9d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.188/veryfront-linux-arm64"
      sha256 "8acc7b10baf5562ef24542b9f15869ac0bb7de0492793fe55d854624ef69032b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.188/veryfront-linux-x64"
      sha256 "bd503ca01168ab4785ba734d8916407bc35cd3d31bf9a68d9958bdd06a9e76ea"
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
