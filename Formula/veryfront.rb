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
  version "0.1.422"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.422/veryfront-macos-arm64"
      sha256 "f02adb64e0a0e19af54c177a25036d0cab5560d3418dda4258f484773ec183a6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.422/veryfront-macos-x64"
      sha256 "f52fe3c91cdee8aaf08c2c2a8e17f1d3d8d0432b56844b16531ce677fe740cda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.422/veryfront-linux-arm64"
      sha256 "d938b4c855f847d181355e6c577e40fffc2a9060cd34fe5adae85367c024040d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.422/veryfront-linux-x64"
      sha256 "89046f76d8601abbde5c2cfa82e762c09f277de5c584d8e8734fc7ee87f3a944"
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
