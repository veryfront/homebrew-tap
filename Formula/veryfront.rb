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
  version "0.1.828"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.828/veryfront-macos-arm64"
      sha256 "de33a615ec0635eae89d642c9d79565622cfbb9cd311f3b516ff8d8c2c0b4e0c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.828/veryfront-macos-x64"
      sha256 "e6354fc73289a237ca8db612c18f395a9c931c0e9de0ff88a04ea855c119f015"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.828/veryfront-linux-arm64"
      sha256 "23c69c723dd2a66d1ef9dc88f5d16a3fa8237a61f857e17aac77184d93e35741"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.828/veryfront-linux-x64"
      sha256 "da9b2776e4567381467a9aaa1dbce69720a46d5a4072b0e1e09a3126ea29801a"
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
