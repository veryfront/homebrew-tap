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
  version "0.1.87"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.87/veryfront-macos-arm64"
      sha256 "b2d2d34ae478f27a7f42414d2ef2f0aeb07e0d2ac0d2a43f80f882f8ed1e006a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.87/veryfront-macos-x64"
      sha256 "a8c586c54e56aee3a1548ebe374f5bbcfd764f9a62050c30e309170efc6d4bf0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.87/veryfront-linux-arm64"
      sha256 "97a97b666c4c351206ec8c4ffbcab0dfafc3a789076b873394924d3fab32f548"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.87/veryfront-linux-x64"
      sha256 "610bbd680abe02c951721d32e84eff45d483c113a1f89b8a510c858679a93b32"
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
