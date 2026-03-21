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
  version "0.1.76"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.76/veryfront-macos-arm64"
      sha256 "b5eda7bbf8438ceec521051379edadb1a13814d80cbd3228b74931f367f2cfc8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.76/veryfront-macos-x64"
      sha256 "594885c3bed356a27340708f08cd06b5856696b5010fa9bca7ab79373af9b0db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.76/veryfront-linux-arm64"
      sha256 "74d1f0aea09818a0afa30214b125136155e77acba64f3edfe95497726ed319ea"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.76/veryfront-linux-x64"
      sha256 "fe6300720816ec7d879197d64f4f87f3590e720352304519384858fbaf258c46"
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
