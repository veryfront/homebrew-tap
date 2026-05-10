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
  version "0.1.474"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.474/veryfront-macos-arm64"
      sha256 "a45ef3025828b172a5df99ccc52bb49607ae24b47aa085f101bbcad054d3b94a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.474/veryfront-macos-x64"
      sha256 "b020dd9a0a57b4eba9959894b305852a577c3bf09b88fc162c533d552fc791c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.474/veryfront-linux-arm64"
      sha256 "057e41ce9162c6fe47bf38d5b9c95f6dde787b735ec7097a7945c0675a166d7e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.474/veryfront-linux-x64"
      sha256 "f18944e3c8b4db2985dd8d6c686e910f617a98f3d1b38f2933058d057cdfd37d"
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
