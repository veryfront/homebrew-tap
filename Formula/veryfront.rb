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
  version "0.1.169"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.169/veryfront-macos-arm64"
      sha256 "86dcd3a74619cd8d297f9518e8a6aaba225b75095e28110267bacc39d20b747b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.169/veryfront-macos-x64"
      sha256 "618f4f91fa39656b50c1d83204e40b3adc8f485e6ca0d930e373c680ac79d59b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.169/veryfront-linux-arm64"
      sha256 "d5d570d40340ced8f4df0af06a11e0fd5844dbdadd488ef55c4ec53425a512cf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.169/veryfront-linux-x64"
      sha256 "d14933a4999c47df768550acb6e872cd7368229c1d772fe95a1f80aee31f8758"
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
