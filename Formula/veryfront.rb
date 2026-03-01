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
  version "0.1.44"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.44/veryfront-macos-arm64"
      sha256 "a9627830569422913d4aee9e95a11465f7cb2ef29f3a638a74021439f04cac3f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.44/veryfront-macos-x64"
      sha256 "be2ea38beb9a2102918f913220932b00f598c3648a58a1ec101b744cd1c58a0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.44/veryfront-linux-arm64"
      sha256 "ad2975a6a228da473436c1911a28ad8cdec26660ccbaa1491d77d03e6d95a6a9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.44/veryfront-linux-x64"
      sha256 "22cde4de103d326a511262b982d15f65f1a4c68bce02903a9cf82bcb892c2ed3"
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
