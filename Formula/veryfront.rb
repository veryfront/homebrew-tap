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
  version "0.1.700"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.700/veryfront-macos-arm64"
      sha256 "affa6d25bf5068f51f042680763324c285dece195584e4df6fd72bd114432bda"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.700/veryfront-macos-x64"
      sha256 "7fd33cef8e9782aa3871209c7309bacf69dacc1b0fe695866af6bf78f67f23bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.700/veryfront-linux-arm64"
      sha256 "df03e0de2257b1993a3fe1d5a03c337dcdb2fe9690202909ef5618947dd32f8a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.700/veryfront-linux-x64"
      sha256 "23b426f1c99601b793cab9cb6e4ecfb90db2ebfef9f6f8e9381b9d5680c7c981"
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
