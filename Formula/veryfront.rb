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
  version "0.1.949"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.949/veryfront-macos-arm64"
      sha256 "9ce820f0113818ff6833ae2599a5c4e43f8e586804eb037c21fe8c673f1065e1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.949/veryfront-macos-x64"
      sha256 "0440750b01f43496fa6915cf53d7b92e262165caa120fbc17ad4ae4b19914ece"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.949/veryfront-linux-arm64"
      sha256 "ca9417d114d38a9b6eda7bae32570b0a68b31c823438ab261a0a6e7f5579b551"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.949/veryfront-linux-x64"
      sha256 "20240b6ceb619b53c6f622d6f39a52de50a32ab7dd17261c2ac3be6303273f00"
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
