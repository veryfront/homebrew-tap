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
  version "0.1.770"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.770/veryfront-macos-arm64"
      sha256 "fd248e779e0f2a93668c4ff148acfa73ea771af6fb4050f420e08f50ec6afd27"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.770/veryfront-macos-x64"
      sha256 "e66d004cde86814fcf1f5d4e385bc001d117a232376a0690c2fbbc58ed8e5ded"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.770/veryfront-linux-arm64"
      sha256 "967f920639ed6d3c2599a4cf6fb18067637342762a0fc7a976024bb56e49e837"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.770/veryfront-linux-x64"
      sha256 "14fc4666934d352a4caeed4b25d77ee406a7893b3effa9913bede2a1bc7bddca"
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
