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
  version "0.1.522"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.522/veryfront-macos-arm64"
      sha256 "2ffa225a86f466d1f5ad5ae094e665402845fbdf2e4327bbda15d398b9f465f7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.522/veryfront-macos-x64"
      sha256 "8f6c29b8eb534bfda8eec8e96b14a963fb86d08cf3a5a0c299b2b23ad47497f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.522/veryfront-linux-arm64"
      sha256 "e21517b8e137cbe5b706b0e9ae21e30a26447152e7ef1add5dc3b4be8db7bd96"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.522/veryfront-linux-x64"
      sha256 "c1b716bf28af7cfed3233bdeac667b094348a0a18022a180b7be06b67aa4ed09"
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
