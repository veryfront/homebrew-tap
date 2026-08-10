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
  version "0.1.1225"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1225/veryfront-macos-arm64"
      sha256 "67961b6c46d9d46c709d51ed7710ad0620fc9a8fa455b6f1492d46daef4e32ef"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1225/veryfront-macos-x64"
      sha256 "ac4e7bf727bf6fef776e7bba8da2c12a2217c5d1bfe89a40a5833690a210f6da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1225/veryfront-linux-arm64"
      sha256 "df923ca0826fa43a2cd35b9e83aa9594c68d61a6235392fc9eeea36f8cc53033"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1225/veryfront-linux-x64"
      sha256 "e344c438721b41f241ed2f41ae14b0059029331f0ff42aeb37107627a357db57"
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
