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
  version "0.1.726"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.726/veryfront-macos-arm64"
      sha256 "78e9cb07ec74f893b6452526fbcc00d63aaae9c5e7f7c014c76ab889518e2b86"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.726/veryfront-macos-x64"
      sha256 "49e4ec5237480867d535d27d7f0de6dd17427b4b5f69a0dbeb2e5118a7f536a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.726/veryfront-linux-arm64"
      sha256 "9e257da9fcd0a007a3fff3801f96e4db5205ecef839d5fc326a2d2206d591d4c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.726/veryfront-linux-x64"
      sha256 "07d61816956dc61d7b8c755507898b36aeba8b3296f356f9ad2590efec17ae10"
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
