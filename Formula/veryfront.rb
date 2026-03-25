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
  version "0.1.105"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.105/veryfront-macos-arm64"
      sha256 "e33bdbd6cc0ac02cc2064e6aad6d34c8ccf21b349b032b328f52850f1df73d16"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.105/veryfront-macos-x64"
      sha256 "1ea72e3e10438291be73daa3552eb71932c24bb719a401895156f349f28cc80b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.105/veryfront-linux-arm64"
      sha256 "0a30439e78aaa5c52645672ec26fbf3aeebac57a92e8003dc5fb253760c366e4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.105/veryfront-linux-x64"
      sha256 "255e0f5c07dcdf1a58c53b7594ece30154189b415223f8db868753fa8cb11fac"
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
