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
  version "0.1.841"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.841/veryfront-macos-arm64"
      sha256 "2846139bcc858f49b001852dafe83fc727850c6fe56f5068926831404f76f8cd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.841/veryfront-macos-x64"
      sha256 "0e9ff22319c1fa499217285c522296c2646e7e2aa71e6da6fb678a79cb23df87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.841/veryfront-linux-arm64"
      sha256 "3837f55b87bdc9ce1d671705bfb7b37a66c185304746a97b534b3b17b1d46097"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.841/veryfront-linux-x64"
      sha256 "36fed2e5d73236bb112fa362ddc9d6dc6afbae54db8d62531c6e0b1fe601c0b8"
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
