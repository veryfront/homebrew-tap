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
  version "0.1.1173"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1173/veryfront-macos-arm64"
      sha256 "cf2e9a5e19b2a0b7e3cda6b6ceaa323929cb176d064171132bc1fa7a2f8da412"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1173/veryfront-macos-x64"
      sha256 "993e4e53fa142ca291e8d35ef267927dbff49f22a10022238ddbc848ed365215"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1173/veryfront-linux-arm64"
      sha256 "55f5e3ff679d1dad9cae28da4eb315307db9d26ad8501962edaece812d0e6081"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1173/veryfront-linux-x64"
      sha256 "81de1eaa9660c04101d727794192a2a6be731b19f562d057627a84e04e9c2002"
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
