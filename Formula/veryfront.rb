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
  version "0.1.1218"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1218/veryfront-macos-arm64"
      sha256 "465957a1a4618235ccbef72311f56ed2c32011a89afbb1487b77cf71cb16a380"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1218/veryfront-macos-x64"
      sha256 "e665184edb31162a2d42612e43dd758abc8031c7593e033111fa7e7285b3007e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1218/veryfront-linux-arm64"
      sha256 "e139e872e189b185b086e1710ca8cedb49c7948567bb02ce223eab0c76050443"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1218/veryfront-linux-x64"
      sha256 "cfe4743d698bd94d41ef5cedcaf381b82767b18620eae151d83bc12b0445d281"
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
