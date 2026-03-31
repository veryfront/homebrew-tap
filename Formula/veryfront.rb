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
  version "0.1.111"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.111/veryfront-macos-arm64"
      sha256 "0d32d881a2edcdb49bae1ae47ae35d9a5bc0834ea9d210ed6f74cd6588f991bb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.111/veryfront-macos-x64"
      sha256 "a5cec63c70a8bdabff5338cc747d86283aa1ab4a652fb40ad1a973461a5f90c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.111/veryfront-linux-arm64"
      sha256 "f8eedb9a1b1e8e5fd8b763bc1b4dfa6cdb39a4571b14e5c9fc2219d2d928f9d9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.111/veryfront-linux-x64"
      sha256 "8a888446df7b05a1e449086aafa21e8538d4561d43fc5ee915545e5c3f30cb67"
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
