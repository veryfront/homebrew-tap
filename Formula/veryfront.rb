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
  version "0.0.91"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.91/veryfront-macos-arm64"
      sha256 "4c3e2f760a7df934d76da514a0581c57ec888afe0a22274da404f038c4091ff7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.91/veryfront-macos-x64"
      sha256 "bcf42f62c9f0c3cb5e158e747b51142a2902f92790ab43451d4e2594b765fa40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.91/veryfront-linux-arm64"
      sha256 "ddaa7e39abb9d04006a1c294ccefdc44b9147d5bd2a53fd0d0fd49c75c381ef4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.91/veryfront-linux-x64"
      sha256 "fba7387990e67e9c51d01dad304b0400957c1531ab895cd112967b63a271345d"
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
