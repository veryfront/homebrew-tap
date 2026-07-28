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
  version "0.1.1170"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1170/veryfront-macos-arm64"
      sha256 "2a48259f804550741d3c1f9e2b97068a80edf93d3cc205909898bb2990201651"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1170/veryfront-macos-x64"
      sha256 "2f43896b5675e50139ccd205c819a356d0a2b4d34d11cb9b5f77ed000a203957"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1170/veryfront-linux-arm64"
      sha256 "01cb5bb43e5723a0c3720971d103018e988cc7f34fae22d79c832584372389f0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1170/veryfront-linux-x64"
      sha256 "7079f82a6bec3dc0c7a81bfd84d017f9923d47607015b12ec687f15ec0c2e4d2"
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
