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
  version "0.1.402"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.402/veryfront-macos-arm64"
      sha256 "8705c2798aa0ebc23cc4d684f3ace1e6271eed93848df16d3c8fcb2bdfe01c94"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.402/veryfront-macos-x64"
      sha256 "f795b0591bd10b3b17d96d1aa3490833b2b0918c26539e17c22f4ec033a85f57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.402/veryfront-linux-arm64"
      sha256 "c65948e6a9ba3c300ff8af94434be86881c661a69753d1f0fac4d51f1d5e7602"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.402/veryfront-linux-x64"
      sha256 "81ce11839c324d860fcad49925779b03a4c47e1ebf98a8ac4e99070161c1c611"
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
