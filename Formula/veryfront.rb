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
  version "0.1.834"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.834/veryfront-macos-arm64"
      sha256 "d8381739e11e955cda13b5a268db9abb41bf52b03c75e601a9a28fdbb861562f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.834/veryfront-macos-x64"
      sha256 "d8d10a9d1112a4ffae5bd23aeda389d3f7e91550ef30e9311ce811cdd905ab87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.834/veryfront-linux-arm64"
      sha256 "77b277335a36f06283283ef1991f06c46b5631210da51f3599aacb85561fc6c2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.834/veryfront-linux-x64"
      sha256 "d051335c7e889efd5b388e1a479aa3ad68173b4fbd677ae0cfa66ba98d5de116"
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
