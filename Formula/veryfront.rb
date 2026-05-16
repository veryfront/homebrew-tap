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
  version "0.1.541"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.541/veryfront-macos-arm64"
      sha256 "263a6d785269c7b315309699f6a1d51aa220967a7ce87c025b44313c20758c7f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.541/veryfront-macos-x64"
      sha256 "8c8d5ba6996388287468f6374225f9c00ea7b764e32c8a4678037bbef0d44ee8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.541/veryfront-linux-arm64"
      sha256 "8ff3cd2a6c0f5bfabd78fc7d4db8609d86b43ca30c12f5afc0f15477759d4186"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.541/veryfront-linux-x64"
      sha256 "d637d16375005ae997e597557e900dc0c9154060d00d0e931082f9d4923f0d9d"
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
