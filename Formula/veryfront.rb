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
  version "0.1.359"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.359/veryfront-macos-arm64"
      sha256 "099f18a79d1de39d23af3af2ed19a46738c457802acec68f874b68e84dcb3964"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.359/veryfront-macos-x64"
      sha256 "56f945ac9b26abfc1e983058d1d270d6f82974b74b23c0cda7d920fc7d135453"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.359/veryfront-linux-arm64"
      sha256 "2a9bd6f4f5f2efcd418976088d33b2fd2de85b49d8735e948e47286737e3d6bb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.359/veryfront-linux-x64"
      sha256 "5571740e7802448a676aadfb5e69015ea96f49f626d6bd8dded902446c162205"
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
