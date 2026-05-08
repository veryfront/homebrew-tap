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
  version "0.1.426"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.426/veryfront-macos-arm64"
      sha256 "b215f7e6e84fc229d2b347b48963fae6569775824ae130eed420fe9abd1ed62e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.426/veryfront-macos-x64"
      sha256 "42b8161b756d151eb484764bf75ac54023a14a2d4974ef16cce8c6ca2eeafb59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.426/veryfront-linux-arm64"
      sha256 "118fccc149c85f32ca9bf2d56cade84d1f635e1d2b2f0d18910080ffe154b65a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.426/veryfront-linux-x64"
      sha256 "5a8c3f0a65019dcda47d105920500ef51f2e0835eafe756bce91d552e73ccb66"
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
