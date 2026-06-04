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
  version "0.1.660"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.660/veryfront-macos-arm64"
      sha256 "3f969a0510b9a8190db33a9d291455877bac7f3cbba2305836e5d3fa98de9697"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.660/veryfront-macos-x64"
      sha256 "db62ff3441fe656d49f95090bad238660980e0c5ae883ac24f499ecc7b5e0892"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.660/veryfront-linux-arm64"
      sha256 "8ecb1f79f217739dbeb03ff9604b0f037e775cc053160670cf4aab06bc894c2c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.660/veryfront-linux-x64"
      sha256 "2c2b85bd6b48e2df07edb59da622ded7d1aa5354f856a8bf7d547910f108d9b6"
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
