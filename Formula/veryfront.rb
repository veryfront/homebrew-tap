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
  version "0.1.1044"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1044/veryfront-macos-arm64"
      sha256 "197c1d09ee3231ee5d97c7b5a0e550468ac5df4c5b59a9128138be2f82554298"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1044/veryfront-macos-x64"
      sha256 "973ac46067037e5937f174427dba563e5139631159863b943927328de2b5bc84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1044/veryfront-linux-arm64"
      sha256 "6e70f1e19b4d4aaf84022cd5336dea1f84cb968847e6bffdb2ff5a44433822e4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1044/veryfront-linux-x64"
      sha256 "a44afe071d8ba700bd35ab0b7d451394008adec35d42d58d7c62abfbd79a4593"
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
