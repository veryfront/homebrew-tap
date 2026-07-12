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
  version "0.1.1055"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1055/veryfront-macos-arm64"
      sha256 "0cafc7506bc7a9be48a012e423c58202908b1682ae32123773c87d8e606da276"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1055/veryfront-macos-x64"
      sha256 "066ac003dd25089f2d3e1300542fb5358639fc9f4f3595fa9cd8da2ea5ed6ee2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1055/veryfront-linux-arm64"
      sha256 "432201e50a1a3a6a5441a54fdf41665c21d166c37c8e4e4b15972323d184f496"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1055/veryfront-linux-x64"
      sha256 "843ae7dc63196182de7c85f13ece82905ed9955fe677562383e3c4acef69d16d"
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
