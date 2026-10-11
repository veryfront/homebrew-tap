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
  version "0.1.1272"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1272/veryfront-macos-arm64"
      sha256 "68f1e687b7340830d1e81bc7d7e41528d700d401730f1e5cb393e9cece603776"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1272/veryfront-macos-x64"
      sha256 "5605e97ec33e36d65acfd01ad3c8a59119a7d14551840e530f54a3eb764ba130"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1272/veryfront-linux-arm64"
      sha256 "5c792f9f6f8de6cfb08c8746e2c57e00900646ff4e4091ebd8a944df354672db"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1272/veryfront-linux-x64"
      sha256 "4121cc1c4a32c176cdd7eed53b852a4e9c21db1f7d328626280113876cc13626"
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
