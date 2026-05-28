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
  version "0.1.609"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.609/veryfront-macos-arm64"
      sha256 "ca406d8364144cf3eb0426c0ea23beebae766f8fa8e3e454df2831eb959837fd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.609/veryfront-macos-x64"
      sha256 "84c06df264b389350e9b69ee251319d6064e8ab311ae267bb405aed7a86852cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.609/veryfront-linux-arm64"
      sha256 "6f16c2da096707177576bfd21088a6e6f920a4619a2f2c06cb1e1e720d332b73"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.609/veryfront-linux-x64"
      sha256 "fc1b92868706da728be8148f4ff8720ae704c5f7dd18c40717ce343061aeba29"
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
