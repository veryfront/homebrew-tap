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
  version "0.1.432"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.432/veryfront-macos-arm64"
      sha256 "ab7fec8852e9e670b0450ee93ca0a513b9c29119e1cec3e6927ac617f05a9197"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.432/veryfront-macos-x64"
      sha256 "b5a6631fb1d1463faa778628220059a0478af4216ccd6e98e0313f6f9756a2a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.432/veryfront-linux-arm64"
      sha256 "39d85c3185c050183d02e9aa6373af8e81b07a8449da57083edfea6f6e375d9d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.432/veryfront-linux-x64"
      sha256 "f08fd87f1b886430e6e8eb3dcef9083f019f484221cdef673c665b2d7ffa47b1"
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
