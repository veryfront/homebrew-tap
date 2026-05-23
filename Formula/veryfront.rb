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
  version "0.1.589"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.589/veryfront-macos-arm64"
      sha256 "e0fe78e11ee0d5da6e1678c1ce32cba73bc731b4cefe40c31ef6c3f74697058a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.589/veryfront-macos-x64"
      sha256 "152a902fb201d81d77b61a607444792848a98b8f586d6746f025fcbcd37fccf1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.589/veryfront-linux-arm64"
      sha256 "a26db86ba0befd84d3dc09574a1c745e1aceb933ff7c6a1452f51b2803eb0a00"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.589/veryfront-linux-x64"
      sha256 "fba0633310e27e2955de9d81df4dad1dbcfa53f46f2736afeb15821c17d427fd"
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
