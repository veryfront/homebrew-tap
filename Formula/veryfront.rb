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
  version "0.1.1120"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1120/veryfront-macos-arm64"
      sha256 "2429b3cd83af5a90d8f0d5a1c63034d19b180646410987437444d6337a163ad6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1120/veryfront-macos-x64"
      sha256 "b531dd961db0a985c7ad40940e4a01f2a9035741750003a3e1bf8ec2ef59de1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1120/veryfront-linux-arm64"
      sha256 "1ca01db1b9d7efbeba7fb6ca143be873d3aebb4cf431cf7796067f9d7338750f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1120/veryfront-linux-x64"
      sha256 "aa10f1dddd32217a1b65b26e5e4302c62e6021550157c198915d87827c6e6097"
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
