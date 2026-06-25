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
  version "0.1.931"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.931/veryfront-macos-arm64"
      sha256 "d91678e6bd745c349105fd7af88ac6bb5d9f19af2ac8fc01a6144ad2de9f9afe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.931/veryfront-macos-x64"
      sha256 "a33b8a54a3c5e329779656c1cfd39fd3381012168f41b8f69c656d5e7801ebb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.931/veryfront-linux-arm64"
      sha256 "3b647afaff03a87620e207ac78d2e0fb10eb4ca801e31a4cd6bb874914ce423c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.931/veryfront-linux-x64"
      sha256 "f6d44bd46f8a81042cc13e9a4365553d308c5db1e68b68a141703f898921f256"
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
