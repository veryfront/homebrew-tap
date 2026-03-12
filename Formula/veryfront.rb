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
  version "0.1.61"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.61/veryfront-macos-arm64"
      sha256 "a223697360908648c14882c89c31f9be2180e94fa9b282c523bcb4cc7a7870d9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.61/veryfront-macos-x64"
      sha256 "b05dffbaf469a3be17605c99ad0f5976929827957a602c39d0a759498f476624"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.61/veryfront-linux-arm64"
      sha256 "81d7c3527089355eb2adb8d2605a27cbaa4ae7d4759b54875d1f833007cdb8e0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.61/veryfront-linux-x64"
      sha256 "c1e2642950243c1d602696d52a5b208e2cf00dfac83a2a3613d47967ad981a3c"
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
