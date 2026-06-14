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
  version "0.1.804"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.804/veryfront-macos-arm64"
      sha256 "916faa2573c6e37f20cb85744838491fbd494afec06063e2f6a47f9e43f7b6bf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.804/veryfront-macos-x64"
      sha256 "db0786bb121d940f0b89f33f265bfa2da699713434931a01c01ce7b2faf8b6c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.804/veryfront-linux-arm64"
      sha256 "08b9bae4ac189491285df6ac0008008413e74f9ebbbcbd5a112834cad4acdcaf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.804/veryfront-linux-x64"
      sha256 "798aea119407158a3907485316b0b32296b75c58579ecc7d0cc8596d31344004"
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
