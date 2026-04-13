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
  version "0.1.197"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.197/veryfront-macos-arm64"
      sha256 "24655475e47af95d06b71b0c065f30d1e2160c0f391452549d6a81090ed676b9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.197/veryfront-macos-x64"
      sha256 "e4f934ef78f304c9e74b5cdd95da0b389453057159c467adbdb3bef737d6c3da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.197/veryfront-linux-arm64"
      sha256 "b22bfe8d5aae42c6e964aa3ab07a8260938def34dfd40bf41b8a668c0a614d2d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.197/veryfront-linux-x64"
      sha256 "3785376e593860b65baf2f73f9b8e12a616c26513ea2f91239943aedc130f672"
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
