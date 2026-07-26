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
  version "0.1.1153"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1153/veryfront-macos-arm64"
      sha256 "09801071acaa20a3018d591bd65bb2a19bc5b7497070e924cfa48af0a8111586"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1153/veryfront-macos-x64"
      sha256 "5f84b6878766bf6e02581ac8dc56819b7bc3eedb87f3063572c1a71e70ba4bde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1153/veryfront-linux-arm64"
      sha256 "697b9215fa2d187f3f48f23a720d77bf980e2bc320b28c2450723a67ebe54cbe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1153/veryfront-linux-x64"
      sha256 "74390d153e5efb36fb895959c0e808adcbee663ded8d67f8c9e4d208a4eaa10a"
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
