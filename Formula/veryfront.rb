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
  version "0.1.315"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.315/veryfront-macos-arm64"
      sha256 "375d47d1f88aaa1ee00e1839ac1fb901ce05b3b4f2fddd96858fbed657ceb48d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.315/veryfront-macos-x64"
      sha256 "bd3e66a26f393fee3f4a98f71ec9dba74d17d2bdf7cc80e7dea2e252ef573997"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.315/veryfront-linux-arm64"
      sha256 "3fa104cfeace9e72b97ddfcd1ec1547a4dfeb3c0a557e99d4396b20c753fa935"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.315/veryfront-linux-x64"
      sha256 "b51929cf5f58149a3644c3c0229174bf08991dcaea9fa03422e86a124efcb863"
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
