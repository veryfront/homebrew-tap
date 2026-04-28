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
  version "0.1.314"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.314/veryfront-macos-arm64"
      sha256 "3e143180be168de2dba1715dec27fd937938cbba176196a43ae4f3222a0dfa15"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.314/veryfront-macos-x64"
      sha256 "b23e103cbc895e2d65e462ab99584d04f712ff18a704cfb8bc20bf5218f09379"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.314/veryfront-linux-arm64"
      sha256 "3bdf09f97a047715763b10ef5d93808e001ad604c1e7f7f2dd20b56f3c21dd60"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.314/veryfront-linux-x64"
      sha256 "8c6ca81fc86046433044a139873eac7ebc299cfd3b6273857ceb90a4dc2328ee"
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
