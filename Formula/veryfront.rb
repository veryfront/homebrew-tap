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
  version "0.1.379"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.379/veryfront-macos-arm64"
      sha256 "3c3c6de07e10c5545fc67e8ea6f6a093828812c0540fa9a9d93070f1047879e5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.379/veryfront-macos-x64"
      sha256 "ed07a3bebe6f298b3a422972f575b37a75a3a1add04da70c1e653162e7510966"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.379/veryfront-linux-arm64"
      sha256 "549004677180e70c1f0513d63d36466337433a89b8b2cd714ca42c164f1ad019"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.379/veryfront-linux-x64"
      sha256 "7f3350fa974a11f4be5b3f8970e541a88aea961ae959cd1328b3aaae377b3ad0"
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
