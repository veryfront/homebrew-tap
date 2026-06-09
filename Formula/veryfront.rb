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
  version "0.1.735"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.735/veryfront-macos-arm64"
      sha256 "8d70f66fc5ce59a4401206fb6f5cf8d63535cbef066c2f47a8f14241d60b90b2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.735/veryfront-macos-x64"
      sha256 "b246423754478e6f96a69cf27a784c02fbf470c5a4607f3610b5ff8577180d76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.735/veryfront-linux-arm64"
      sha256 "e25395867d925e2a81ff55b1a1ed3a658de3b18478d37fd73532bbbe29ac98db"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.735/veryfront-linux-x64"
      sha256 "59e1700e8b3388da3733e2e5b8d6c9db47a54d3d33417d46908bc5ba6980af90"
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
