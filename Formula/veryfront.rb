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
  version "0.1.508"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.508/veryfront-macos-arm64"
      sha256 "9f5b437d5a295b957ef581b4478b079e09e1cfd4c0794497c8c1f7b3e2158f37"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.508/veryfront-macos-x64"
      sha256 "9c254a3b2f31fa18e086de850f19ff88be9e14199a6e14c7aa35347df6b54371"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.508/veryfront-linux-arm64"
      sha256 "c7c12cfb7da2cc0e5192168de40dad96303a0e54590af3dcf48357a62e54a9ff"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.508/veryfront-linux-x64"
      sha256 "36279faccd3ef6b8237109374b0e88b57525b4838f6a69727681595f62793993"
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
