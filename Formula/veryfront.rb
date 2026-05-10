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
  version "0.1.471"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.471/veryfront-macos-arm64"
      sha256 "bdb62a1cb656c15ebf715320f1dea26cbdbb908737a490dd4994d457693b751d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.471/veryfront-macos-x64"
      sha256 "512d6179ea6dbb00fa301df0835e0de01e49571754fabbc59e9ef129605ab0f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.471/veryfront-linux-arm64"
      sha256 "3e2ed3fffcf493867f14a499a7353a40c06bbfe2fc1e8debcab00f5565492100"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.471/veryfront-linux-x64"
      sha256 "074540ed7eb14d293182d4bf45a265751205c360f8f1e672b6a41149b3984293"
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
