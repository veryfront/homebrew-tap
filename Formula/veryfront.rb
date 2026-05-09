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
  version "0.1.440"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.440/veryfront-macos-arm64"
      sha256 "212c236584dfaf5df1cca883cc7a966ed2b5b8b9d689c31f843332d56a63d8a5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.440/veryfront-macos-x64"
      sha256 "7a0157707ba31f9600a9b7e98cc7f5ac732c402d943ed05b7cfeafb03cc29653"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.440/veryfront-linux-arm64"
      sha256 "d38256018346a9cdb066bfdcbe7c6560974f25f8379d1dcb9128d5383c92dcc3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.440/veryfront-linux-x64"
      sha256 "ed5e83f48ddbf8c15985a289b5c3abc43c03bac0178632b184bd7b519c4be477"
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
