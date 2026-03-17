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
  version "0.1.72"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.72/veryfront-macos-arm64"
      sha256 "3369e25d5543ba41a41985833786f751d9005b9ece4cfe809322367a1570d554"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.72/veryfront-macos-x64"
      sha256 "65d652099df0e80311fef715f5ef2f5194b08b8acaf0af03a3543554c2db4d02"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.72/veryfront-linux-arm64"
      sha256 "9aea6aac46e9cc2adea9f425867549d294ad51bc1ce5920076cdde83cd1c997b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.72/veryfront-linux-x64"
      sha256 "4adf0cb671a1a7824a288379647236f02e6a26dae5a29e5b36e87525c7d5e096"
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
