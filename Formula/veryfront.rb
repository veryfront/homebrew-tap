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
  version "0.1.851"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.851/veryfront-macos-arm64"
      sha256 "03d71b8c1e998c80a0c8a83eda5b544779be547d325e96874374850314ce5b3f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.851/veryfront-macos-x64"
      sha256 "faf25fca12b464f78c1857b13fa2f9fe65eb1550189f416db9a689806829e226"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.851/veryfront-linux-arm64"
      sha256 "ce12fcf49fe1bddde749cf87bbb1ad25e8d1d3241790303a2b197858e27621fe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.851/veryfront-linux-x64"
      sha256 "860ee333a3f11ac24bc1a417a4048c7d45a4d16578fb46cb386b6e80e54dca45"
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
