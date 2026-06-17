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
  version "0.1.838"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.838/veryfront-macos-arm64"
      sha256 "745c9cf5390630a71f6cd1b9a3722a2c0d22fd68ed114ae873423f42d0cbfab8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.838/veryfront-macos-x64"
      sha256 "e19e8c5731954fe463ad8dd50fce9e2a1a6464a2a4294f928b81675235e6c1b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.838/veryfront-linux-arm64"
      sha256 "4b4714cae7a725cb5e7c20e868551223504c592accbd14efd4230f122d8292e8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.838/veryfront-linux-x64"
      sha256 "1352d07f8045fda8bd4c09600c4eb0784233a68d3c5b5578f00239d6339ff1a1"
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
