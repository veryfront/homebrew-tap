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
  version "0.1.254"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.254/veryfront-macos-arm64"
      sha256 "5822694317a78d7f1bb2c2c380ef31ed1bfabbab65eecf33eada902705d13b0b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.254/veryfront-macos-x64"
      sha256 "24dc51392a14fd034f37945144eb8bd40fd1c746e14a5292eff443e9fa3da9ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.254/veryfront-linux-arm64"
      sha256 "46557d4e5148b8155d48d1f0dba22e34aad98fb7732b073c1ac3657c296d5e83"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.254/veryfront-linux-x64"
      sha256 "0dd23c4e572f113acc4c6561929b875b896885a4235dac7829cd91c5e8735afc"
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
