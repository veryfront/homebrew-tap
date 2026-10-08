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
  version "0.1.1270"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1270/veryfront-macos-arm64"
      sha256 "d4b5e6eb0f6e2cbbf4de8bdb059f76a7892332934ff0c0d7dc808ba1fb436e70"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1270/veryfront-macos-x64"
      sha256 "1b4bc2555c2016a3273fae0de162e6800e9c3888249dcc5671184e6291d77761"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1270/veryfront-linux-arm64"
      sha256 "6cdb334e381a3acef15eb63e6e4e018af1a8fef40dc44eabe54e2ddee73467ea"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1270/veryfront-linux-x64"
      sha256 "bbf2d3e9e782524e463008b3b0c5c989d1dba31bab4e7c1ea55845a0622c0772"
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
