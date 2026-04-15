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
  version "0.1.211"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.211/veryfront-macos-arm64"
      sha256 "9e332fb3114ddbced95eabca6185e45ef68c0af537bac2230f757165bbdd56e0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.211/veryfront-macos-x64"
      sha256 "1768b1571261f58a3dfe52af4736571da81fe86ebd9667aab38d34c025b31dd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.211/veryfront-linux-arm64"
      sha256 "e08b39797dc4dd48dc347e17737e9dc2a50ad396265dd7a4bdb9afb404d467a3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.211/veryfront-linux-x64"
      sha256 "76c5ea64e2b5db73e336959923f4ea292f1a1afaf66c63e251ca48c443e86450"
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
