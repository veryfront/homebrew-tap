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
  version "0.1.101"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.101/veryfront-macos-arm64"
      sha256 "c8f4e340f67c23250c35160f40195250a4339ce242ee6864683b437b28cf3523"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.101/veryfront-macos-x64"
      sha256 "6c71784a513c8cfef96a3b77e22ea752a487007c1838506523703a3321a06e02"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.101/veryfront-linux-arm64"
      sha256 "630ab86e49ecbe6d113c6cd5ab26abed9f2d292659ba4caf41a50ef6be6655b4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.101/veryfront-linux-x64"
      sha256 "cdebf83ea324fc94d74832ae833badaf12b237a775cc8866215a97b8bd828bcd"
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
