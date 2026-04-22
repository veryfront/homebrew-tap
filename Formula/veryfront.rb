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
  version "0.1.244"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.244/veryfront-macos-arm64"
      sha256 "1189ccec5f866d31653626d67296ab1d2d0989bab5545d0a0597a4d0cbb353a3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.244/veryfront-macos-x64"
      sha256 "c2ed5d8ba417954234f089c20300bf5f8a8339cdf5c845e6ddc2ef5fcb58e961"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.244/veryfront-linux-arm64"
      sha256 "547ba5d7f7ba9f553751ed523adaaf3accab986846e857a6eb0da111d25187e0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.244/veryfront-linux-x64"
      sha256 "3faab857a3833ce03257dee5dc8b109819ae534ad4627a5503cc3972049f6e8e"
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
