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
  version "0.1.928"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.928/veryfront-macos-arm64"
      sha256 "cd4bcd36ed9824b78a443f0e7aa6943a2099b216fa2e46a3626b0ec7f22db736"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.928/veryfront-macos-x64"
      sha256 "65f86f0c083f2e3540c85e457a16f476297545dfadd30dbe2147506a13f243f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.928/veryfront-linux-arm64"
      sha256 "738c06466617bd263bb54fc53e2e83408c1f22d01934b4c95a0d565cc90f1c45"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.928/veryfront-linux-x64"
      sha256 "6c845dc81eab9cf1ed019508a521ef37b70f90de42fd5c43070d9b85700d99e4"
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
