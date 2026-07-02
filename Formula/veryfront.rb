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
  version "0.1.989"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.989/veryfront-macos-arm64"
      sha256 "06d116ded0bd372862725ebc55c011d48e620dad3e6aaa575522e97d6821cc87"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.989/veryfront-macos-x64"
      sha256 "cfcffd5b0174f9ce8a6570226e747f991f22967b719b70bdf36133278c9440ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.989/veryfront-linux-arm64"
      sha256 "6952c3530ef8870ef315f7ed640310fcd2c01f35dc9592d507939438f4b1f37c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.989/veryfront-linux-x64"
      sha256 "cb7195fb5bb99cfd5d7104ac6c8bb1e8baed9044f6f59306df4acc192cd5d861"
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
