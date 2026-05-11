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
  version "0.1.490"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.490/veryfront-macos-arm64"
      sha256 "3546bec3a865dd83170b63ed32c47c3180d8ab61c4f6762736ac7109a13631f7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.490/veryfront-macos-x64"
      sha256 "bba6ad527dd4059a0e32001666fbd4a4ad5cb7b43cb9b20667b717a12be62e63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.490/veryfront-linux-arm64"
      sha256 "2aecde87bb5f803db6baf3d8ee9ba93fa579f2d47a10d93c6b4c4e3ba7edb194"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.490/veryfront-linux-x64"
      sha256 "17c947fa8459a2dfb83d8a142b6d3c833aee0ec22ee1551c4deda0d403f3f622"
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
