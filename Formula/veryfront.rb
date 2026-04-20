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
  version "0.1.221"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.221/veryfront-macos-arm64"
      sha256 "e9c700b73a4612703d27e46e0ea57460bc85f7acee4cd2c7f6ec8f1c077eb316"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.221/veryfront-macos-x64"
      sha256 "9066bda5d0c5bb90589d19221ee63f29080bd920b26a7d1cfd7ff40566761b51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.221/veryfront-linux-arm64"
      sha256 "7378253c6ce05fcdb93a9b81241fd6bbfccb4f5445d3d0ee894dbca16eaba62d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.221/veryfront-linux-x64"
      sha256 "2f2d38716a7c16dc8af589cabca0cbd58c36a9fd2b372e12c70309505dd39b04"
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
