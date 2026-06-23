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
  version "0.1.917"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.917/veryfront-macos-arm64"
      sha256 "75e38562c252f2a4c09e762eb23aff3c0b0519347e43e7082a5993c6f43c8ddd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.917/veryfront-macos-x64"
      sha256 "bb2e05093762b8aa8623a922ac34773ae2b8c61f1c02d63598d7abe1ca8dd432"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.917/veryfront-linux-arm64"
      sha256 "1045a65b39774bab6d1360b49c31ea2d44a8fef8da3e891683c23cd95664f1a5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.917/veryfront-linux-x64"
      sha256 "cb2fd8a45e89a92bddc45b1fc5e04d2c8c1d26b94a089ddf2f551f68d19c5018"
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
