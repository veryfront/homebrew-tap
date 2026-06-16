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
  version "0.1.831"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.831/veryfront-macos-arm64"
      sha256 "cb3a922f5010aaca209533b99f29b9ddc3ed9c2eb81faaea001412c91cd8b1d4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.831/veryfront-macos-x64"
      sha256 "8e53e2b91dc8288dae03936fb4ef1b65fcd4f2de8ec4447e2ea4c44f5c93ff58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.831/veryfront-linux-arm64"
      sha256 "73dbe4cf652f2026ad99a7747338a597c796835be1dfab1586e0e6e94fbbf23b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.831/veryfront-linux-x64"
      sha256 "0806dcfb66e3c024faa220bbb168adbe4ac2a2ee7ee16be7fe6b745b20a4bd78"
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
