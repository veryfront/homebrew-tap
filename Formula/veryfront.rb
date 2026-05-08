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
  version "0.1.418"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.418/veryfront-macos-arm64"
      sha256 "340d7886e23114f0d8e9146911cc793a36d142ce6f0e98fd8cf932688af72e92"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.418/veryfront-macos-x64"
      sha256 "e763ec5ea3aa6fcb2e11880771397e38c43bd59b7ef82373443c73e9fab012f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.418/veryfront-linux-arm64"
      sha256 "e2832a471531621cefb2b3947963c0115a9215ba8cd4c25546fffb53e8615d11"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.418/veryfront-linux-x64"
      sha256 "39ddcf03f2d67aef956b85d2534e79b29a8e4110e08d42dee9575b61f650eaab"
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
