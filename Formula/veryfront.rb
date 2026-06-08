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
  version "0.1.688"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.688/veryfront-macos-arm64"
      sha256 "8c8dec630f851e2dd214ad3de5b6f7608f765dfd6a5cf3dcc1e98b95da3ca9aa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.688/veryfront-macos-x64"
      sha256 "8270632fb282bb3ebdca5398dea8479d81f324d400c4f5ffe8cd1fe96b161f15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.688/veryfront-linux-arm64"
      sha256 "d5bbda0acb765421e77d1ab5dede9534ae6380a531a2be9ce33abb2040d6addb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.688/veryfront-linux-x64"
      sha256 "bab0aeac213469216d1efe1db8b9e338a598948718d7c91acbaec104d48b1bab"
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
