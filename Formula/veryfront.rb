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
  version "0.1.544"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.544/veryfront-macos-arm64"
      sha256 "d7b5fb002a762fe8263c781a3e3c60d1e54341366966afa13ddb4a52561f6277"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.544/veryfront-macos-x64"
      sha256 "837749166467d9b6318973f7a7525cac5cef1a8d9eb0740cce62f5a2b3681557"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.544/veryfront-linux-arm64"
      sha256 "0b5238f6ff1a1fa47b430583866e980254d4cf3892a178f91b62bb83f9e06122"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.544/veryfront-linux-x64"
      sha256 "d2110b0ab82acbcf18975791b0b545d39c0fd86dc8b504b6c343ab1085e886a9"
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
