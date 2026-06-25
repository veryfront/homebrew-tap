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
  version "0.1.932"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.932/veryfront-macos-arm64"
      sha256 "66d15d109fb796c96b36c50be5b49d6e94ba257aaf8e2cc12649fb0452739f05"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.932/veryfront-macos-x64"
      sha256 "96a86cae44a0647e9d10bea8efd396ee3ee3d017092d93978714c3b07f31617b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.932/veryfront-linux-arm64"
      sha256 "5c3f0790a1b6dc8adedb857cdafaf3722d455968ca385dc57dba7edd7f1aac8a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.932/veryfront-linux-x64"
      sha256 "4dde1f8990ac3fa437ecdd7ff47d042d1c9457e95cca49d8e62ce1e0dcfd5a06"
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
