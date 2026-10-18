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
  version "0.1.1280"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1280/veryfront-macos-arm64"
      sha256 "8f98cd94ce6b89a393d7bf6ed097c10ce32d2019adf9611a7690ca0a56595d17"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1280/veryfront-macos-x64"
      sha256 "29701abf38409b08fd1f3c696ba81bddf4d1530884ac9ed3ba044a3ea4a6c871"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1280/veryfront-linux-arm64"
      sha256 "1441cc762e8d5faa116d93a576262b0deb45d30f2394e4ae3f59db6a91822b2a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1280/veryfront-linux-x64"
      sha256 "469061211901376f2deffdecc109360f691e0f868235483673361a0901a335ca"
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
