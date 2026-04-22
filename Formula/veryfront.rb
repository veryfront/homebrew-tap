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
  version "0.1.251"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.251/veryfront-macos-arm64"
      sha256 "bccb7c5d1200184ad747e43320b375794e3044334ffc477ec183ed9e0c2e2bd1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.251/veryfront-macos-x64"
      sha256 "e9efb4b8f602f2097cd2f583cc9b4ed3197e352102ff67361a895c7af457c19b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.251/veryfront-linux-arm64"
      sha256 "e38fe4fcfe83c9d9ce39f285362777125182f1638a126ea6da7bbbe0d80b41ef"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.251/veryfront-linux-x64"
      sha256 "dd2a16c1857e76756472854f1968f0c7d141732d07bf5fdd66748e1c33e9483c"
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
