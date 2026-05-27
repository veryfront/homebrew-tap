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
  version "0.1.602"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.602/veryfront-macos-arm64"
      sha256 "090237384437848c4ca2a31b058b335d2e01d77cfbb157e239e6f36d7a13dfc4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.602/veryfront-macos-x64"
      sha256 "7db7eba20aabe205551a351d7941a42573d108c99e1370f8ba184516be8e1838"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.602/veryfront-linux-arm64"
      sha256 "5b640de9b4d3f2f22a79fa304d32240280b4fcee657df36ad90d7958d4d2ace0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.602/veryfront-linux-x64"
      sha256 "7216b66303721dc58e1e0cc6068ad13188604477e8b54040fdc8a9c1f07bf3ff"
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
