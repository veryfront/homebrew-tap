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
  version "0.1.655"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.655/veryfront-macos-arm64"
      sha256 "36207022faf5009a419cc4eebd7e055fcd536eb17d22422d0d48fa6d409b7b9d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.655/veryfront-macos-x64"
      sha256 "be92496fe56ef24fd9e837feeb1c9e9bfcf47289725250ea161eaf6f65e767a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.655/veryfront-linux-arm64"
      sha256 "a500bb0fcd9adcca7159fade4c7cb9c17d9028a446a9e820ba7915f6d5d5cd14"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.655/veryfront-linux-x64"
      sha256 "2c977a12d4547874dc59940edd20515da4f8f4945217fc6f4f50c7216673281a"
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
