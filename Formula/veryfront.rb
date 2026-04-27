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
  version "0.1.285"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.285/veryfront-macos-arm64"
      sha256 "46f01580fba86337dc30d7659fa41a9a13cd1e884f4f9153ff9067262567639e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.285/veryfront-macos-x64"
      sha256 "13e3961b7902f63cdbd1b4c9f34ebb441558204a78573bc0eb07ebf371ecf0be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.285/veryfront-linux-arm64"
      sha256 "73aab69e5241d7cd00d97a803324b813470f5097aad9f5238e4ff61b19f4d847"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.285/veryfront-linux-x64"
      sha256 "51781b6a06b5d841d2fd9e3b76d0e9b3bf47b9a512c8082d85487aa721fa5153"
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
