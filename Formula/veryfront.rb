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
  version "0.1.940"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.940/veryfront-macos-arm64"
      sha256 "f2d622dfd999212d78e2668643d113d142dfa9b530cd9ce1a3eafd2152beb03b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.940/veryfront-macos-x64"
      sha256 "d706c066ca772ffd54007e6378dddf550265f15d66d54ed6f7bc3e19707c781b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.940/veryfront-linux-arm64"
      sha256 "227d7360e2e076f05145d0ca4cf43098f03601c0badbda1db667004e0be75607"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.940/veryfront-linux-x64"
      sha256 "51d792bc780c50a0b84abfff5d35986d5b5cb973995197c81e00e8ce81821ca4"
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
