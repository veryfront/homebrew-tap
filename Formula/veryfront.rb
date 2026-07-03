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
  version "0.1.993"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.993/veryfront-macos-arm64"
      sha256 "166604a0d5d4fe7b76bc64ddac057bcd0e3e12eaa52766c5e98e3ff38c3d4d63"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.993/veryfront-macos-x64"
      sha256 "99bac73429c9e13cf3ac300c604cad850262e2f84c7d73bddadf95344ac8b3ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.993/veryfront-linux-arm64"
      sha256 "3f9c967cd77ea604e270c4087972fdc545727d82e7f466670f45ae8e75603a82"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.993/veryfront-linux-x64"
      sha256 "4fb05d4fd689f179d661b21b89866e4c12aa8a60b31e8a837bd8e382a5ea626a"
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
