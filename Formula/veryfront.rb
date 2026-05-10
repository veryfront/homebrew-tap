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
  version "0.1.464"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.464/veryfront-macos-arm64"
      sha256 "e795502dc37ee649daa9c6ab1fce2a9ed01af465be0d01e1e50236c7a1de3fc0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.464/veryfront-macos-x64"
      sha256 "754d65995094f5047331943ef69e36737368ec002b1035fa6bc776cef723e90d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.464/veryfront-linux-arm64"
      sha256 "70242556d45abca364666b9353f94525e92cfb7b54e98d2e965b3e5cf37737a2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.464/veryfront-linux-x64"
      sha256 "abfbacbba73ac81991ba2907c1fa7b7555afe1b4051d80790e897774f2bd9473"
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
