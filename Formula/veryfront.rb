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
  version "0.1.58"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.58/veryfront-macos-arm64"
      sha256 "741589251b94385dbe773e6009f81fa2a58e801d1530dec5820d440445346eb6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.58/veryfront-macos-x64"
      sha256 "6390475a8a68acb97f7a5c489dcfff6639f6b5c7a45036d4977015aa0f2aec17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.58/veryfront-linux-arm64"
      sha256 "007f290073b88d70df221068398746367fc2c93f6e7da75d70604604282e3ecc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.58/veryfront-linux-x64"
      sha256 "394e0c18de95775020eb99038612f1fe3422f1fa734096de3494aff37169d8ba"
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
