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
  version "0.1.1092"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1092/veryfront-macos-arm64"
      sha256 "3c9710ed2241df2eb08e0bee4c59968084c8c70964c17e806188041b8de3fc10"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1092/veryfront-macos-x64"
      sha256 "b7bd80ef963e590f3f65f21049cf1aebaad1fc7c35db8aacc04319d5012454ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1092/veryfront-linux-arm64"
      sha256 "9aee760b58f5d05f717aa587cac764c2eba088a9c248642e94fd8ee2dab85f49"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1092/veryfront-linux-x64"
      sha256 "4e8ba366a4eb2b6d8cd7a87c43301c5b0a6c76e06281069e9e40ea30092fe3d4"
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
