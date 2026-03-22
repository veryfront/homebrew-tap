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
  version "0.1.93"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.93/veryfront-macos-arm64"
      sha256 "bb6211ab3ad36a49c1b06ae6dbcc8965f250665cf568235a634428d5d6f0dc93"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.93/veryfront-macos-x64"
      sha256 "b851dd8dfdfd8d89bfe0daf127db0cb83ef52f060bb379d0d752732bac8802fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.93/veryfront-linux-arm64"
      sha256 "22229fb57b31c97324fb36cde16c655e14f1b71092bc6f408d1333a598d26ad5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.93/veryfront-linux-x64"
      sha256 "d7c6223e89030a4bd448551470b79e5e0d01f06bde22c38c62fd454f3e9b13c7"
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
