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
  version "0.1.1066"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1066/veryfront-macos-arm64"
      sha256 "1130bde2d4b02c1ecabc3bc549efe104cfbaf8d01b3a228ff2ea9970ae63f856"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1066/veryfront-macos-x64"
      sha256 "61bc21146e2c225632cc28d10470eb87a9d8188dc12e6f8ed0ce4298c01f9285"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1066/veryfront-linux-arm64"
      sha256 "abc0a0d09f3228715d1f4c1171317a1f61b892ca679057c8fbb70dcacf64bb8f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1066/veryfront-linux-x64"
      sha256 "3d49a81d3dec28db4b60e184e0d35417bd960a1bc800448498279729114b0da0"
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
