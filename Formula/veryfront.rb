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
  version "0.1.907"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.907/veryfront-macos-arm64"
      sha256 "c0dad66b2565bbe46e0bdaa972ef66f42ca1a536be2fd22a25a21cbe4353ede9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.907/veryfront-macos-x64"
      sha256 "89d8d1981db5502ff411fb3c129f68b58e4597d08d1e8a78e8d37496b4380447"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.907/veryfront-linux-arm64"
      sha256 "9da24c4241180a8f0d3ffa6cb3b560457b5e27d51f7cdd2078b01984676c3ca7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.907/veryfront-linux-x64"
      sha256 "38cd4da2e3b20d6c44560a5e649f3561dbc1600a9eefe6c0060ecb5e649c6098"
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
