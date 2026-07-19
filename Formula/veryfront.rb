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
  version "0.1.1086"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1086/veryfront-macos-arm64"
      sha256 "90208e0e0f49164bade5a20a5d8dada9f414f2d6f01480c7a78e32ee1c30f63e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1086/veryfront-macos-x64"
      sha256 "3fdb3ac8b6d74fbc67312175cc776d468f57ffc668152e32dba6b02c6aa2cf60"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1086/veryfront-linux-arm64"
      sha256 "b6631b739e2d0d68188533a508ed19111ffd7a4e07a0709e23caf1b3b793c16d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1086/veryfront-linux-x64"
      sha256 "4b337bd4bbc0ab8b4620e587ec12318d296339a8f2105d7c5fe28325a4c5fb44"
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
