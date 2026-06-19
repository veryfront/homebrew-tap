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
  version "0.1.864"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.864/veryfront-macos-arm64"
      sha256 "f4677eaa2ebf8694f56c1530dfe7f27b2ae2c5370c4aa98f443d7396af176d74"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.864/veryfront-macos-x64"
      sha256 "c13ae906f416fd81b0d0c2461225eaa62cbcfee08b4ab07d6610baf35cbba830"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.864/veryfront-linux-arm64"
      sha256 "813475e601dc538b5b634c1e9341d8ca97f917a96f3049b7132657d7a8022a8e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.864/veryfront-linux-x64"
      sha256 "63fd1d02869334e0751b00271c8ce5da256cbeac028b8a97668ff5c4f1d250cf"
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
