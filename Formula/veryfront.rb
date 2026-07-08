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
  version "0.1.1030"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1030/veryfront-macos-arm64"
      sha256 "7f305af92ff3202682b027269da08a27e4fe7dd32b8dc474eca7e7657b69305f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1030/veryfront-macos-x64"
      sha256 "628ba9ecc9ee07a9e62342c44b192c87550571049dc1ef2694a0bbc929e14113"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1030/veryfront-linux-arm64"
      sha256 "932757c5e3a3915d86d0b9d46a9da59174f35715c5e0dcc3775f7af5c5a18b23"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1030/veryfront-linux-x64"
      sha256 "1e8edeade62d61723b6cff1f37f2ebe970a80e0470cbf98faf62dca684803075"
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
