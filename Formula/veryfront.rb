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
  version "0.1.50"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.50/veryfront-macos-arm64"
      sha256 "070d7d3ceb8d17a800d43050efef9623390033072445e0f78579c1a54cf73416"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.50/veryfront-macos-x64"
      sha256 "c494b18709b25ce3855838cca8c5c1fc443686de6bed1b0d8d3adb6de3cb2677"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.50/veryfront-linux-arm64"
      sha256 "8df8f4ecbf024aeda5e878b5f16bee1a077202d7b1e4df5a2ccec70a30bb82ef"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.50/veryfront-linux-x64"
      sha256 "ba525bfcdc25d86a1b3a792299d73bd84adf4df8aeada4ff4f982caa304e3e57"
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
