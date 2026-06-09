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
  version "0.1.739"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.739/veryfront-macos-arm64"
      sha256 "42ba321427a2eb0e326f1b635a54eb94acd321b7488cc63a0f980fe294c6cacb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.739/veryfront-macos-x64"
      sha256 "af604874a09866d918f9fe5b646c0d03bfbc953ed903b40696a71f8c711fbb23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.739/veryfront-linux-arm64"
      sha256 "2deca3c37ed731500b36cf74c9b36e35dbb7fef411046e25e6ada1e01742677d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.739/veryfront-linux-x64"
      sha256 "b3c56fc5010f6bbd6eeac6e35c32e896373b2d5b21d319b67f89695131be68a5"
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
