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
  version "0.1.870"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.870/veryfront-macos-arm64"
      sha256 "3fe2dae26069d9396e22681e2f6212f6a34084421fbb1dfa5608fd14bf17689e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.870/veryfront-macos-x64"
      sha256 "72d13a7e72fbb0a4b965332b34fc858a8903264d4d2611df299d79f3c3470636"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.870/veryfront-linux-arm64"
      sha256 "6159a51ba8e43ac7814932d37073910124a21e0367518576ef012b2e423b0f9d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.870/veryfront-linux-x64"
      sha256 "9a456a4f34e57d61eba19466366b9af52bfc1caa6cd4d0012341d3b6c478547a"
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
