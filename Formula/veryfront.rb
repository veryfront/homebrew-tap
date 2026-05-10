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
  version "0.1.475"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.475/veryfront-macos-arm64"
      sha256 "9468278fed025cd16c5b78f7af2d23bc62d0de48745c462e5e15ef436b43da02"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.475/veryfront-macos-x64"
      sha256 "41dbf7d7dfce68fd9653518fc73b336f39e893c44aaef28b4c889093ea3910af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.475/veryfront-linux-arm64"
      sha256 "f484b9b9939d401e10348d8f3a0b96599533f640d0c26cd251f48b6f2ef7865d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.475/veryfront-linux-x64"
      sha256 "794c3f119869581c56a0c1bc8aa16cc209200c7098f3dfabb3310fe9c94e959e"
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
