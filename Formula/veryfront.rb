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
  version "0.1.1108"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1108/veryfront-macos-arm64"
      sha256 "11d637ba72962ecdfe3d594e34b81d9b8b172e13a437f554208adece4f9f4c9b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1108/veryfront-macos-x64"
      sha256 "8a000722da1b500abfc29bd6cb754d29055b1f0a4aef4607e4f8dc5289c3dac4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1108/veryfront-linux-arm64"
      sha256 "da658c202cc8027e82ee52af3dcd8e168a9e63564e08a3624338062f3e08d4ca"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1108/veryfront-linux-x64"
      sha256 "21dbe84a8128200febfc0ea5583887b8c3f3b735fa92ce2b5478a56635bab2ad"
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
