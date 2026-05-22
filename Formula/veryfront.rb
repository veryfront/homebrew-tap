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
  version "0.1.580"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.580/veryfront-macos-arm64"
      sha256 "1c17902b0234fbd159876e382807116b6770f4ed453ca8e80aabbe9ab9f4357c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.580/veryfront-macos-x64"
      sha256 "37f32d3dbe523e94d13af3a6d1dad1308daeb2cb7af0b9504181cbf030bd9997"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.580/veryfront-linux-arm64"
      sha256 "1da2d854e2009be5326e00972d29d4467ed0b9a1cba323c5254c9353a9dd3fee"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.580/veryfront-linux-x64"
      sha256 "6bf9c6c0ae205fae44b25a9e6bfb8ba4b5037ea91e7198c65fed76ff4d6853e9"
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
