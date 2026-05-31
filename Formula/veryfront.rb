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
  version "0.1.622"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.622/veryfront-macos-arm64"
      sha256 "7e5f43993a259f4fde5c65420734df79314602d82ce7aaadc291325bc97ee445"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.622/veryfront-macos-x64"
      sha256 "dcbfbc35c68c1e193c8f3f4daf67d5241edf5db3fb94d5eb7fa4e0a59872d67a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.622/veryfront-linux-arm64"
      sha256 "4f27738e71c107390004f0ed76e849959a2b26cfe57639ad0fa72d141cd52541"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.622/veryfront-linux-x64"
      sha256 "16b03f299709ac65f06b069750e5da64f46291db3592437df7cb3b65a03db155"
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
