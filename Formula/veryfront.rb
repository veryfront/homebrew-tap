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
  version "0.1.623"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.623/veryfront-macos-arm64"
      sha256 "451bf85c2f1e831fcdddb7fd048882e05889601079723472f568a443eed6afef"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.623/veryfront-macos-x64"
      sha256 "7ff9b3f68ba82f0c241469a159ae57b930eb35f7bc5658fc0e6a8a789120d290"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.623/veryfront-linux-arm64"
      sha256 "e75d7958efce03248a62667570b68f2a40134eeb9f16116aaab88196cd041b69"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.623/veryfront-linux-x64"
      sha256 "d273e029e6ff5f156e00bf269623b6f79be6853dbf2f1d1fb7c2f6c3f8cb14ae"
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
