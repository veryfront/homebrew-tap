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
  version "0.1.654"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.654/veryfront-macos-arm64"
      sha256 "3ab62ae8340c10cf19139451cdef9f9dcc888b63e9218b2082b18013e0de7d20"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.654/veryfront-macos-x64"
      sha256 "ab9e9e894e455d4e46d7d71e963c7bedacab5a57bb7d1897c2217f16b2e2e2fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.654/veryfront-linux-arm64"
      sha256 "3ba7718e9f5c9922943d0885b1a3623d5f3063f299fb425ff1a9bf1b90755de2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.654/veryfront-linux-x64"
      sha256 "7eff31efba9007d2071ffbcdf13eadd02d0442e432cc48fbefb27000f0ab624c"
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
