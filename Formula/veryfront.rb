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
  version "0.1.820"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.820/veryfront-macos-arm64"
      sha256 "56c0a97dcd221069b7be5adad8fcb2bf5889e69765e5664b85d585a7792ff35f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.820/veryfront-macos-x64"
      sha256 "37b6b30c2e66684aec24cbf54b91af49eb36fc3f6406f029be71b41b315e320c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.820/veryfront-linux-arm64"
      sha256 "1a8c5a146c50d7f66f4e27442da52673ceaa8a5ab80b5a3272b93b8652306b3a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.820/veryfront-linux-x64"
      sha256 "1618549c3b10f6e9bbd51c00b3b0c493bdfc74c0a4864c048c18b088ae588591"
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
