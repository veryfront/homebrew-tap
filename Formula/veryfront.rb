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
  version "0.1.1202"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1202/veryfront-macos-arm64"
      sha256 "c9f4cbde53ac766e5d6bc94a193af1bef2e002732e53db526cdd036b5b853d6a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1202/veryfront-macos-x64"
      sha256 "41234dcbf069e281dc68c077714cf1c6d1a2b2df11e19f2bdcdcb6c5a9ff81de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1202/veryfront-linux-arm64"
      sha256 "59c9602ccb277a79f0f8bc28d316934730e6335846b64a9defe535b044e516ce"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1202/veryfront-linux-x64"
      sha256 "1b6e6e2d05845d669d3aa863baa381048c8a1a2bd7ee9a3b45a676668bf0a2c0"
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
