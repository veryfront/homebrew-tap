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
  version "0.1.263"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.263/veryfront-macos-arm64"
      sha256 "1681149f5e1e14e66575643457bf1317528ff9f525f81c485b189e309712268b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.263/veryfront-macos-x64"
      sha256 "d6989688e0e7571d6dbbcce3d0481ebcaa816a94d8c780cb07c8e4648fcc683a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.263/veryfront-linux-arm64"
      sha256 "78f58e0b82ab5dd9780ed6dd261773181ecfb0e219daf5236ffca926bf8b2953"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.263/veryfront-linux-x64"
      sha256 "4364e325c47ebaa305f6125ddab749048323ec234d2f21619b201164d757f211"
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
