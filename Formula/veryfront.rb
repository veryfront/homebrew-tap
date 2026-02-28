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
  version "0.1.37"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.37/veryfront-macos-arm64"
      sha256 "05a9add872e2c07443e49f010b545aab369beea2a855540aa65693df86379193"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.37/veryfront-macos-x64"
      sha256 "31a51e2188634a68a19266ef0e8b2d3c1f9050d32ab7a60701e1f6163f5a63f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.37/veryfront-linux-arm64"
      sha256 "ba6a3bf0fdb8f562eeaec4c2c434d3c0cb50dd173981903a58b3aebb917c1d73"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.37/veryfront-linux-x64"
      sha256 "3aa67b582ac5118384b7230da8e1d70a00969d77ef7544a9cca6e966b7a5b433"
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
