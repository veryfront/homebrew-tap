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
  version "0.1.1119"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1119/veryfront-macos-arm64"
      sha256 "bbd4ce5af132e5f6a6544b2848cd34d08942590dd8fe9214d9a7fd62c04ff7b9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1119/veryfront-macos-x64"
      sha256 "de7b1d97e8ac0081bea967c80f8d4f03076c5d5490f0d59992c3c278fdc5c4cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1119/veryfront-linux-arm64"
      sha256 "c00e1d9dc9741354ec1bfd62447426c81829e99bf0dab41f9231ce933da897c7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1119/veryfront-linux-x64"
      sha256 "40d42a165a1b81251c8de09ed9196062304948b5ec48fc36efb618026557151d"
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
