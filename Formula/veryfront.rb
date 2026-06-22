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
  version "0.1.911"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.911/veryfront-macos-arm64"
      sha256 "21b172a9a9b6faf1506b9cb6c20b19ebba44fe62030168c83418391d262dd3e8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.911/veryfront-macos-x64"
      sha256 "561388169f1120ab02b70bc59d1bd5babe6828caa7312c5712d079b862f10784"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.911/veryfront-linux-arm64"
      sha256 "9a4ff2f1bf1fe381424a03dbe7e07dbcb49e21217759dd7ac3b44d3fdda9bc03"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.911/veryfront-linux-x64"
      sha256 "022986e05d92173ea057242e68b08cbe15c74a092ed1b3fc61d525ada8db3a66"
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
