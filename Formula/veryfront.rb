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
  version "0.1.227"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.227/veryfront-macos-arm64"
      sha256 "1131705db6e377421e4620f811fc0b1988f19a14d33de0211a7542f41a345066"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.227/veryfront-macos-x64"
      sha256 "87fd4f3b880f4b8504b5f71cfed8ecfb53ecdf683e8ee9a8d0af3806cde5e74a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.227/veryfront-linux-arm64"
      sha256 "edffd7f3350a5e415e5dd6b6bb150d594b5b0ce7bf14fd1d5adbe6f3e7b49f0c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.227/veryfront-linux-x64"
      sha256 "c5c9bd028e3cdf54d9b90eaca87dc0e853e173689e2bfd7bfc376a73f735f07f"
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
