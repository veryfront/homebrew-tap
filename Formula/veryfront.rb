# Homebrew formula for Veryfront CLI
# This formula is auto-updated by the veryfront-renderer publish workflow

class Veryfront < Formula
  desc "Zero-config React meta-framework for AI-native applications"
  homepage "https://veryfront.com"
  license "MIT"
  version "0.0.75"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.75/veryfront-macos-arm64"
      sha256 "PLACEHOLDER_MACOS_ARM64"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.75/veryfront-macos-x64"
      sha256 "PLACEHOLDER_MACOS_X64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.75/veryfront-linux-arm64"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.75/veryfront-linux-x64"
      sha256 "PLACEHOLDER_LINUX_X64"
    end
  end

  def install
    bin.install Dir["veryfront*"].first => "veryfront"
  end

  test do
    assert_match "veryfront", shell_output("#{bin}/veryfront --version")
  end
end
