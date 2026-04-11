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
  version "0.1.180"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.180/veryfront-macos-arm64"
      sha256 "7c6df89c3200a3b1f7aaac89921edc3c04d5470b62813a3fddedf51b01c17ce8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.180/veryfront-macos-x64"
      sha256 "39a137de5e2fd88cf77da100431303340722d360bd7dc05709a357507ac62c2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.180/veryfront-linux-arm64"
      sha256 "d308eb187bfda4036a7c0d6ba2788f38f9ae709d10d94cf26a844ce374a272ac"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.180/veryfront-linux-x64"
      sha256 "2faf21edb102b76ead2c582497ff1104281b240ff566d73d6a8e323515f92c1a"
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
