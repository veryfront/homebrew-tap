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
  version "0.1.1287"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1287/veryfront-macos-arm64"
      sha256 "f6fed6a40a9f918ceb272b7a6e8585f6f9d090753f7a848c14d9441d5690e2eb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1287/veryfront-macos-x64"
      sha256 "b5f21011f38fe768f174cff2c275b556455ff20b96e217d354ec459b4e9d9933"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1287/veryfront-linux-arm64"
      sha256 "bee9fc302456b1b32e2098d3df39333b7a072ba6643c8296c6d67ff172ad341c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1287/veryfront-linux-x64"
      sha256 "9d87529b9db73fa610b8ad55c7c5122017f9001fe10195f5060dc58786538cf8"
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
