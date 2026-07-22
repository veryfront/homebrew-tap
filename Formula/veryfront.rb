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
  version "0.1.1107"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1107/veryfront-macos-arm64"
      sha256 "0a657ad7e39f3858f0a0e45de43ba64183c520f3e5cd29991a06b45f82c279be"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1107/veryfront-macos-x64"
      sha256 "c19ca573dafc80a3995fd0c544eb78bc441fc6397ae44dd80cf3b069acbbe976"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1107/veryfront-linux-arm64"
      sha256 "3bc57da7311ac6d817c6581c7ff0345d7d3d4e13fff4fe5f5d54ea0fd37200d6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1107/veryfront-linux-x64"
      sha256 "23a9fcbdcf6b971321b5db1cbdcb261f7b598a48a248ac96640e2fd020a50793"
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
