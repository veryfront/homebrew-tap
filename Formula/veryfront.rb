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
  version "0.1.880"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.880/veryfront-macos-arm64"
      sha256 "5aec5b4b1c304b0966b1d16b9cbf200a223fde1a6e144df9933f2891abf5fa3f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.880/veryfront-macos-x64"
      sha256 "249ea52fbbc532014ed72fcab6f5cc07368686195c7ffaa706f20755accf85bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.880/veryfront-linux-arm64"
      sha256 "1c6a08ac874a86455f6a31fde3dd4c599c05f4eba31dad306844623d68f73d35"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.880/veryfront-linux-x64"
      sha256 "c4b4a20f25a322086bd18aab38a3528fc40a584e26d53a7a92f42307a0e4d4ea"
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
