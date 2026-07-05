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
  version "0.1.1012"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1012/veryfront-macos-arm64"
      sha256 "30972ee2ed9c3a7658dac70a2d4f6a418a345a02df580253eb66cbc874193a91"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1012/veryfront-macos-x64"
      sha256 "46d5a880cd3e974cb161107a27a9c2fb7023a0f04a7d53b87d2be763046c9b03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1012/veryfront-linux-arm64"
      sha256 "568af60eec49129592ea6d8a4d94861b5500162d354c348e440d0516f9f230e4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1012/veryfront-linux-x64"
      sha256 "f13dc5618b25c802ad315dee427e2eda86ed45ac3b69583d5f66d4bd2e3398a1"
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
