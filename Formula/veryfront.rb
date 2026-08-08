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
  version "0.1.1215"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1215/veryfront-macos-arm64"
      sha256 "0257519b42a53758992827f05715148f7422c802f951a524168f9a331de76ac2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1215/veryfront-macos-x64"
      sha256 "f44ab40f7d562fd93392a5145378dc94fa68803eb2f31e72fe56cfa0446c27f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1215/veryfront-linux-arm64"
      sha256 "df144de8a5d5edf4885cc26dcce8a48c9236c2c5ba51cf0cf04a6792b046c4d5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1215/veryfront-linux-x64"
      sha256 "f736917d9bbb819052d072c242cfdd0838ea0320869b3dafde2ae7a933e30f9d"
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
