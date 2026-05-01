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
  version "0.1.338"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.338/veryfront-macos-arm64"
      sha256 "d58959112cee8c8f6f9e76bd08d4fd75f8350e0c2b45f32ef0217e172d907036"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.338/veryfront-macos-x64"
      sha256 "e2bdec743ea62d4482048c1c686841afbe94dba971baebe9cbc4c25ed55ce6e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.338/veryfront-linux-arm64"
      sha256 "018a01c23518316f5b951140a859ab0fa6961108b324c4edb007d1303fcb2249"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.338/veryfront-linux-x64"
      sha256 "cefb36bf769eb90775fe1306f0461aedaad1311ef1c65cdd95658d71b298e70f"
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
