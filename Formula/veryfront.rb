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
  version "0.1.1065"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1065/veryfront-macos-arm64"
      sha256 "1475394ba42ca1f5cb4da19b10d46acbc0c3e0248b87f399f0e7b91fff9a95c0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1065/veryfront-macos-x64"
      sha256 "a343d9f2e6a3b515b1cff18854f24d4b1bb0e1efe7ef6aedfb0c1a70fc9ce58f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1065/veryfront-linux-arm64"
      sha256 "d48ad3a0bd7c966a959aac76183173f3caf50b92796d8e5488842f4ddf0e5050"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1065/veryfront-linux-x64"
      sha256 "ac0d25dc1eb9962234de3dca7b9080a318e460ac15292d34f3b6290075b754d6"
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
