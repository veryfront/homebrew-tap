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
  version "0.1.1148"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1148/veryfront-macos-arm64"
      sha256 "4bf677133bf85f97709ff4f265f872096b3cdc77fdb3215279a366483c612fe1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1148/veryfront-macos-x64"
      sha256 "9cb81fb86aa8649099ee4da9d27c5c8c5dc4392f3778e539df39690fa4f17c39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1148/veryfront-linux-arm64"
      sha256 "2cceabc4383df80e7677b40e5413db2512b3a7cb633a1b409b30c25594a6decd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1148/veryfront-linux-x64"
      sha256 "d374e2a6ec076a2a86c806b1923c3441838b607cd13ae17ac3e45c4768fc11fc"
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
