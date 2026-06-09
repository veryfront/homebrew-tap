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
  version "0.1.737"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.737/veryfront-macos-arm64"
      sha256 "c958c255d672e45aa500d4e7fc7dfd97426623300a7b9de2062a4ddbc97bd141"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.737/veryfront-macos-x64"
      sha256 "c11a1538cac51003bdf69d532ab65cad24bade95c5c9590f9591da19c3f22395"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.737/veryfront-linux-arm64"
      sha256 "c8ed409ae7f0d5792400088030f1be4654a46dbf1f449938e9af20791f7fce68"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.737/veryfront-linux-x64"
      sha256 "30adc13c90088c7da1933b88367b5c925ea4ab8769d957a32ba34b60d5ab4c42"
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
