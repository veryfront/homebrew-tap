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
  version "0.1.225"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.225/veryfront-macos-arm64"
      sha256 "5bfbf270b9074bb1ea93f681b373ffb0b65001901add9f251530810c4c27b673"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.225/veryfront-macos-x64"
      sha256 "2d000b0e25e960e45a3b08f97b98bf7337500c544bbfbce50e2aaa301cf1139e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.225/veryfront-linux-arm64"
      sha256 "d26ee57b4bb2594fc8c01af63ec64181a08a1078c2b95d24910363c9c4558578"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.225/veryfront-linux-x64"
      sha256 "fb7bb3412ce66ae979040319dd15c35eff9a919d095c2b1113a215e45b7cfda1"
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
