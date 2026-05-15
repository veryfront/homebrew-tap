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
  version "0.1.528"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.528/veryfront-macos-arm64"
      sha256 "d2dce434b027561f4a7629dc25e343174a4c5ff2f45ce3f4ecab1f1069241626"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.528/veryfront-macos-x64"
      sha256 "aedb8b62806abedc5311ef0b1dc3c208cad97fce74ecb544ba0e547fd65cc0c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.528/veryfront-linux-arm64"
      sha256 "36c13dfbeabe6b9cf1d5623cc12166e277471ddf1256b3dfc66a3e5587ebf609"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.528/veryfront-linux-x64"
      sha256 "516e89089212e66b99e2d6d29b263274efe1ef9b09d9dc7c4ecb3b0377dfcccb"
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
