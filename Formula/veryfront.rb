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
  version "0.1.64"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.64/veryfront-macos-arm64"
      sha256 "9155fac21fb8ce89fef342990c8b7daec2a5e239e4dbaa4dafd53e9a96957a97"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.64/veryfront-macos-x64"
      sha256 "b256d2e00fdc47d4f28d65d21ff125c44731501aa18525cbe14a21fc3187d9b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.64/veryfront-linux-arm64"
      sha256 "b090a5040225866b84c27a80872a4a992f735bb221cccae5e6fed3c0c410c7d0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.64/veryfront-linux-x64"
      sha256 "4958095380bd96767387fed8a3519b1067648d2dd0a9b5e9d8dba38eb2be6c9f"
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
