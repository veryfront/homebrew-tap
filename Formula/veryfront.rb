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
  version "0.1.598"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.598/veryfront-macos-arm64"
      sha256 "b9bb9f7e7a1d4afb7e1b02f2116c3371c931624f7abd1b0dabdfeb270a6309b8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.598/veryfront-macos-x64"
      sha256 "6e673862169135134e166dbd55258f24bcd58feb7a94f70c64286891775750ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.598/veryfront-linux-arm64"
      sha256 "1c1a24da81d4854199cf3c98ab31ecd5c8ed35d98ec6e3631e4ffb0e0bf478c5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.598/veryfront-linux-x64"
      sha256 "7ac9b9a737c569cec4d9e6fd8df8a2c719f87d9dfca403d128f4eaa213316ade"
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
