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
  version "0.1.990"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.990/veryfront-macos-arm64"
      sha256 "75cb459a540907b03d2568f3df887acba7ec9131f12a8ea7fc0475bec94a3d12"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.990/veryfront-macos-x64"
      sha256 "eb5409f76d55c11448c88e1d20a966c6919d50b538f9b5056d7314423f8aed3d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.990/veryfront-linux-arm64"
      sha256 "3ea5f9f67b3f6e4edf4836fb5af74b194fd86f3c8f2a3f56d586455c5be64602"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.990/veryfront-linux-x64"
      sha256 "4c13a7398ba52cf3d9e381dbdec47e1eb0d9f86b5fff474cc2af567d017895e9"
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
