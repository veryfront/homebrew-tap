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
  version "0.1.573"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.573/veryfront-macos-arm64"
      sha256 "f279c0deeb5f01f356be4e88408036c2f7a37abeaf71ed25de9d017e14d4b8ea"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.573/veryfront-macos-x64"
      sha256 "9a7efa5ae7530627e8d18e413c82f8225bd49a40dcdcf105f8296b5f0b9c1783"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.573/veryfront-linux-arm64"
      sha256 "0855edc7c3225eb71a606a0d13846894b307237fe6e1f2a50b67e7885e7f73d0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.573/veryfront-linux-x64"
      sha256 "71daa92cdb19d411341aad124df5812b6a80116a18a6a9269a2fe7c4d5dfdc87"
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
