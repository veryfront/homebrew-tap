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
  version "0.1.843"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.843/veryfront-macos-arm64"
      sha256 "8eb9cba2edabdc53f8d90bae9472c79e47e3ad5e81c020c900fd93bcaad1a27b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.843/veryfront-macos-x64"
      sha256 "81f71e0af9194d39daada8ccefb323e5a7f70c964fac3cff44a9275f152cfab5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.843/veryfront-linux-arm64"
      sha256 "c7eb6208276d467aff4398dba390d427be4d54a995f8aa69f11c4495aa0131da"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.843/veryfront-linux-x64"
      sha256 "91a9cc97ebc48ba529661af8f94443a79a2c258bf036927b12aebf7abb6d05b6"
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
