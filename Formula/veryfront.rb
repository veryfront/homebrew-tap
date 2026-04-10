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
  version "0.1.154"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.154/veryfront-macos-arm64"
      sha256 "ca2e339feec08446c04fb1bedbb50a32675f37d0803832213929dc37be2745a2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.154/veryfront-macos-x64"
      sha256 "d55532fb8634a6abd2120416b705e821347f7291f945114ebd5a23cd7097984c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.154/veryfront-linux-arm64"
      sha256 "0da9438c9dc7944efce1f0ea9ef892086003ac2868a9d519e2bcdaa7fa6a350d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.154/veryfront-linux-x64"
      sha256 "baae8489cd0fba22b766dc59ae61e22639d5389e0419d605dda6e780a3f4e99c"
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
