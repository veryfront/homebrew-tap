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
  version "0.1.193"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.193/veryfront-macos-arm64"
      sha256 "bd27ad219262a45a808bbba4e5565fea029bf5f2cc72efb1bbd0bfc48bfff175"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.193/veryfront-macos-x64"
      sha256 "654675f32d8df5e53c90378e728915f695525f416d175bef42c38f02d52b3f6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.193/veryfront-linux-arm64"
      sha256 "e2b28c8bb4ce43da799d8618b5894dcbebe4f9fc934f152bd5464dc745863da7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.193/veryfront-linux-x64"
      sha256 "3fbbb22ac15b47c5e69101120a0a85432d11bf27ea17338cfbf486fe446dcb4b"
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
