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
  version "0.1.802"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.802/veryfront-macos-arm64"
      sha256 "6a3b25b85d1a3cb02229b06fb8ae1d7a09d44ef91127b564af6faf2a59e4c683"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.802/veryfront-macos-x64"
      sha256 "f2706ec12f741a3de164f43e491fd4f98463aa7a46d63bb477f24ac14d5da376"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.802/veryfront-linux-arm64"
      sha256 "9e55ea897b274a9711fdeb03c9bd8bdde124370d64733c095ac4ecd740559af7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.802/veryfront-linux-x64"
      sha256 "58a930521c40062a3136211d722c9d6f687cd759ef572794ffca02095fda4f73"
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
