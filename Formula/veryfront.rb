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
  version "0.1.1259"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1259/veryfront-macos-arm64"
      sha256 "a41feca0dce16ee49903e53e66d2e3ca836ca984bbfb341b1f339ed61ab24aa8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1259/veryfront-macos-x64"
      sha256 "a5f37555647c5b2fe7870a99b9860f360af6b33f8025d591d0e4ad1c536c71b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1259/veryfront-linux-arm64"
      sha256 "fab08c0d7f4906c95674fdd9f4d07799012b140a0056a260fe7e475661b3367c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1259/veryfront-linux-x64"
      sha256 "10887aab2fa3e916d01d85decc55fa6a1c04a77857b5f4e16ef7cc43b068d62e"
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
