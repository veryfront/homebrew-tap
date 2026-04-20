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
  version "0.1.223"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.223/veryfront-macos-arm64"
      sha256 "9f02731d9eb2fb9e97a4c0ee3c9fa2c50c872ebcd461006c3cf78ab8b8075c71"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.223/veryfront-macos-x64"
      sha256 "11d1f76595154ae372c37120882ba3708a853aed2dd12b3f179d3f69a8c358b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.223/veryfront-linux-arm64"
      sha256 "eb24785a893612a8cacc39fd63ce27a08a1d009ec319887f89b3d1a7eb32dc85"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.223/veryfront-linux-x64"
      sha256 "7c3694397b675b3535592b851389d103dbe6f1ec9c933038bb11be8edaeafb73"
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
