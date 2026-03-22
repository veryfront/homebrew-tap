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
  version "0.1.95"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.95/veryfront-macos-arm64"
      sha256 "c6bbdd72a76fd57a661ace8179b63ccf1ced01720489bdb9d640753805a70022"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.95/veryfront-macos-x64"
      sha256 "9ca30c01461705d52dcfd7eb009f18d56c6e16321395862d35dd6a0eeeaa1713"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.95/veryfront-linux-arm64"
      sha256 "ca3af45cc0813408f63e4a0d6a803404c7b8321a30a0586d0c02de0a5f036a05"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.95/veryfront-linux-x64"
      sha256 "1147238eccf8ea790829c44a88c8462d213d57456a30abf4ca326a839f17d94a"
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
