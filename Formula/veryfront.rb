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
  version "0.1.1195"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1195/veryfront-macos-arm64"
      sha256 "9e1151544019e7c97a2bb88dcb24f3b3c4eb6d0b92bf44948b8b16ba2d5f1c65"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1195/veryfront-macos-x64"
      sha256 "647e3449425f272a373286d6508eb59ea90b42c4b8df63e94ab942436f04cc06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1195/veryfront-linux-arm64"
      sha256 "4cb15cfc429236886b39cc8f0ebdc8a9b7f01f6b4e8dedff8e3f7436f52924ba"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1195/veryfront-linux-x64"
      sha256 "b0682ae755165f29f4fe84b0cbd78031b2eba34f19a31d443d5eb0d0d8f8c2ca"
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
