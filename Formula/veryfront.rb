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
  version "0.1.1098"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1098/veryfront-macos-arm64"
      sha256 "b7268f579d76da5643cfa4bb385d1317d9b3ad2b584e8ded60b80d79206327f4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1098/veryfront-macos-x64"
      sha256 "7784f8aa641eec35eeb636c3c101392ae3d8d525bd177ce728d9a0a217824d0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1098/veryfront-linux-arm64"
      sha256 "6fb57bd3072f1c3d06a536b7f8db32e755d8031547de43d3e95f511a7943e555"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1098/veryfront-linux-x64"
      sha256 "9d1f020bbe82f023194668877ed2b5154e78acb4f815fa5f94f4012cf29b2099"
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
