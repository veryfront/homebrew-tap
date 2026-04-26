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
  version "0.1.278"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.278/veryfront-macos-arm64"
      sha256 "11c7e6614f746fff3551548ec46e8c1043eebfc5bbc7a78f291c9118716985e4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.278/veryfront-macos-x64"
      sha256 "e6d26985a7099b461e32140fe00ad3515b41f6b000d15a2d0830cf4aef77ec37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.278/veryfront-linux-arm64"
      sha256 "c6a94fa8c1557b2261706d6b989667d2705dfeee597a63e38cde8978256527d5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.278/veryfront-linux-x64"
      sha256 "a2ec1d0b851085def9ed4f8a78f66a2ba3fe4b9d4ed6aace057fbfdab5fc1368"
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
