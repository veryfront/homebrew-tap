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
  version "0.1.1059"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1059/veryfront-macos-arm64"
      sha256 "097fc20a739b845557deaad5aefd4661b850aa36ee83b3e09d88e1cb18b79727"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1059/veryfront-macos-x64"
      sha256 "ba694efc161b9cd69dd1622071bdc88e5ba087183bcedd6681a6df63e12e8a36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1059/veryfront-linux-arm64"
      sha256 "793026f3e542aa9827ed42ee57395593e78e9ccf949750b3522cf729fd4b149a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1059/veryfront-linux-x64"
      sha256 "c69343891e83472fb4c53598d4b1cab42796cf6a8a2c711de02db0c66a1f9a2c"
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
