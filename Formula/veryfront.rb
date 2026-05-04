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
  version "0.1.375"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.375/veryfront-macos-arm64"
      sha256 "9df8e7f48a43eff79519745eea4d69a09b3736ac025d27ba825d6e0f86574d86"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.375/veryfront-macos-x64"
      sha256 "a29212f41c3a380e8e34789a1524ab874c3aa906c9830f1fb8eee3c2939e9c26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.375/veryfront-linux-arm64"
      sha256 "915e920cfa9bd8878fc76c80b2aa58dc739362b082ceb8e7af73ceee20a9090a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.375/veryfront-linux-x64"
      sha256 "090076592889c3ef5ed1dd79e055c7ee3f31776f9fe42cbe023005c12644c2dd"
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
