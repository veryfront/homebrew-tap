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
  version "0.1.1081"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1081/veryfront-macos-arm64"
      sha256 "890a48f6af9a683a89344615aeb05d8acaf98cb7d9acc48fdf50a3bd44e8ab58"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1081/veryfront-macos-x64"
      sha256 "611c0eaf719bba488f0487fab765c78a79d4f0da0d90bcf45901e441600865e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1081/veryfront-linux-arm64"
      sha256 "b3b57ca0c2c712c0528721e66f9294da4be27a360cec5a649a0575091af10c07"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1081/veryfront-linux-x64"
      sha256 "6cb96631b35ebca8df8fe6260edd74043b8473ef5f46a29baa016b3900d594d7"
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
