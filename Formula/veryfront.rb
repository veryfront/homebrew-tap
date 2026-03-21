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
  version "0.1.78"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.78/veryfront-macos-arm64"
      sha256 "e08e16440173d3ba7edfc9fdcdb578d027e8ec8bf7b6178315aa4dd9419e16cc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.78/veryfront-macos-x64"
      sha256 "8f3d49dc7e2b1392ce4bb1975d8838d28f0bd5a1e03f33623f8d49d070f6283c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.78/veryfront-linux-arm64"
      sha256 "2787d47fefe56670d25d966485c2bd2601920dac5d4b4a9d5067c4e03ac24ab0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.78/veryfront-linux-x64"
      sha256 "e030abdc7cd1a0ea9a464efc17e5839c082c41f6d73d2af031d1aa4816390d47"
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
