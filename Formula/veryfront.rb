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
  version "0.1.13"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.13/veryfront-macos-arm64"
      sha256 "3e8d1e103096510b06559e025028482fcf84779507c8378a55b1fe290e611fc9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.13/veryfront-macos-x64"
      sha256 "6d3b1f491cca171563deb95912829239e0a06bcc2bad965b9c1449993d80c6d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.13/veryfront-linux-arm64"
      sha256 "ed3fb1682beea3d2d0809947736fc671963bc74e806e2a1f05f2c6d303271979"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.13/veryfront-linux-x64"
      sha256 "c8675a79eff6d63ef9398b11df0dd71720b95fec09fb1c8fa18360b8d29491fe"
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
