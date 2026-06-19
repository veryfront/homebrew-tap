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
  version "0.1.862"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.862/veryfront-macos-arm64"
      sha256 "3433c52f132839e31b70c4097f0765d0184bc24e6b16dc7c647dad150dca806f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.862/veryfront-macos-x64"
      sha256 "f4ff397077ec8bf457c1f9491f5cafb0c369c9e45fda2738dc73e68df668d66d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.862/veryfront-linux-arm64"
      sha256 "4489b4c9d15b91be1309eb2f46b01fdbd82911a8c42ffedefacc68bc95ae4322"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.862/veryfront-linux-x64"
      sha256 "c9962db56ab7ce0b3e39cd2c8c7d1026caf30d2d3062c9bdc3101d6096f133da"
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
