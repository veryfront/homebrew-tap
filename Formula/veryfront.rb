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
  version "0.1.727"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.727/veryfront-macos-arm64"
      sha256 "c792bde2add1f71d7de413a3b716a93fa6fdab1531fad6cfd3d072b51bf4be28"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.727/veryfront-macos-x64"
      sha256 "f28be7235af51cb695b88d4f142d6d62f3adc0b16a328c8d555b5cf769db06be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.727/veryfront-linux-arm64"
      sha256 "1a8cbba394a382357436ba8ac4d305f537a2db40e524db6826ef7ef0ad36ba8b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.727/veryfront-linux-x64"
      sha256 "4fb262097239600a814301dbc23176a9de7b99f95f02e2498282e49fd613c678"
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
