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
  version "0.1.994"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.994/veryfront-macos-arm64"
      sha256 "88fc6d060d61c6adfd39846eea1ca204f72a1e6c2aadbdcf80180172b2e2e758"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.994/veryfront-macos-x64"
      sha256 "03f48424cc17f7fef3bcf7c9850dd1f36a8983abc4de649f406f6cb6aa51405e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.994/veryfront-linux-arm64"
      sha256 "b2599c053731f2e16a6895cb2b5538498292408dc532a1500fd7cdfe89a12936"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.994/veryfront-linux-x64"
      sha256 "7427beabf16e46db02a4a95c1774631996dcbd1ba6de1f48a28c21886095aebc"
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
