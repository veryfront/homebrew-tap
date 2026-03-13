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
  version "0.1.63"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.63/veryfront-macos-arm64"
      sha256 "eebc4f97a10683460ed7b5521b28cad925751d5c3aea56e54f44a6f68a46d712"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.63/veryfront-macos-x64"
      sha256 "b4cdf66d4788a1ca8bc6459932bd19f3f8a54b0861020d9efa0daedb52cca940"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.63/veryfront-linux-arm64"
      sha256 "d449bf40d39a07601ae9703db4f29a829675e89c924b76e5c36f53e67c3d5bb2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.63/veryfront-linux-x64"
      sha256 "d5c6d71d19dd3d65971c796cca609644182ef084b2e4cf27a26adff4f46d9689"
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
