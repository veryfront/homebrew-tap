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
  version "0.1.527"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.527/veryfront-macos-arm64"
      sha256 "27828c4ec5260c86abb3c455307a24fc9756f105c2c709687315d44d23ae445e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.527/veryfront-macos-x64"
      sha256 "da938abf78339915e9123bc2ca378b61e67a1acf963bb98e409214327242abd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.527/veryfront-linux-arm64"
      sha256 "76c79508b7fde1e2c8c66667d9aa6ef31a2451c06cdd07a1263fe94453dc8d2d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.527/veryfront-linux-x64"
      sha256 "1bec4db8e623628991e7812b39d65ac199e0665732e56b2ce466a69e58648811"
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
