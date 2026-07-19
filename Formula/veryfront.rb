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
  version "0.1.1090"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1090/veryfront-macos-arm64"
      sha256 "ba7ecc7f97dfae8b63308848204bf9509f01b022721c187b6d5aa0ee5ac35669"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1090/veryfront-macos-x64"
      sha256 "bc4a0b06c11181bfe6de2811dc8adcda98f2a28cf6313623b3e0ecc3d76f5eb9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1090/veryfront-linux-arm64"
      sha256 "33ca0bcd58de0d5f04debeffde1ed3836e152d72d80f0e883cd00dcc95f984ae"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1090/veryfront-linux-x64"
      sha256 "0208dc8ec06a210b25d6ae222d3d2b4ed8a1b11febf70d12b9296fe442280987"
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
