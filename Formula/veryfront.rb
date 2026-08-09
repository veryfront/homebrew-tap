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
  version "0.1.1224"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1224/veryfront-macos-arm64"
      sha256 "341b834adf47a63fe81fe9d7ce9b88d12bf697f469f986120c4d9a77ba3c3fa3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1224/veryfront-macos-x64"
      sha256 "bd6019ee3f7751dbb50a469c88d7f48116581a59eae858f92f1049b3a0c299d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1224/veryfront-linux-arm64"
      sha256 "583b88e25e043c02b54c4b54764d5cc6ef9bcea996c4cc44a70723f3dc95a5d8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1224/veryfront-linux-x64"
      sha256 "397e7c8ddfcfa73db8fe28f4bcb85175462bfb143b42f49eaf9b7c155c154ef3"
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
