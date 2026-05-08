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
  version "0.1.414"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.414/veryfront-macos-arm64"
      sha256 "c8e3b4ec900d32f346bb22d6004a717d77b8615cb04769ec82276680fc6b431d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.414/veryfront-macos-x64"
      sha256 "eab35e4b576ffa904db91c595cb3671aad13128f583b634cf2d45f3fb98b5de8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.414/veryfront-linux-arm64"
      sha256 "2116b0802c9a9dfe6ca1455fa92ae99ea9f6389fdf9bde9c84613f7938b9cf76"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.414/veryfront-linux-x64"
      sha256 "1093bdfaefe8e4f2edcd66a6a3a2fa5502b45c22326087dbfe3513768b786add"
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
