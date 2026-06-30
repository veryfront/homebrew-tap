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
  version "0.1.980"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.980/veryfront-macos-arm64"
      sha256 "bec6ce08a97896d02d4080a1d04465d21a6b7067465a3a97982f8ada1e6b4a75"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.980/veryfront-macos-x64"
      sha256 "ebce9bd55f74cc52845915d91bb61312bb0ede147272d0b159d745b2180177ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.980/veryfront-linux-arm64"
      sha256 "ce1b78ec048f0432425726373e0411ab79710f7c547e2fb049a9e68f977c8fb2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.980/veryfront-linux-x64"
      sha256 "38246ffb980cf6203f5a094429faec2b9b7e0f9edf1b6d7631a34afe0c1c50d4"
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
