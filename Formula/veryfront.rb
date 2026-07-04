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
  version "0.1.1007"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1007/veryfront-macos-arm64"
      sha256 "609252407df7eb76a4b70f4332648b34670b4485158cbf42d265834f8c2207c5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1007/veryfront-macos-x64"
      sha256 "c44814dc10ae2b85ac6e6938dda194035d97bcdedbc7f0acb125057a0ba1c465"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1007/veryfront-linux-arm64"
      sha256 "71baa55134cb1b2b770fe4a8a3f0f3d1fce78cd7630bee87b1cf8bcdcdcf2edf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1007/veryfront-linux-x64"
      sha256 "f50f2721eaca3e7bc93e40193f82c04262d98d1cfd436ad83b7cabff1c2312bd"
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
