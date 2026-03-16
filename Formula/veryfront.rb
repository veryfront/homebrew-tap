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
  version "0.1.70"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.70/veryfront-macos-arm64"
      sha256 "43948543c76f94b7a6deb1601a34caab37fd56fe1c8149ca5b047ee77744374b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.70/veryfront-macos-x64"
      sha256 "da115f27fa8138ad7ef8ed7803e0a1a637cf086496c20e548c58dd0004a0d277"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.70/veryfront-linux-arm64"
      sha256 "bb0f5b7a5dfa854a6ce86f83e971221f4c3286a2c6ee3ebaaef54917348700d2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.70/veryfront-linux-x64"
      sha256 "7e9c02aa713e4531681f9c24da09a895fb06f7c47839e2752fb73da1d93686f5"
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
