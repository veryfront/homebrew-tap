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
  version "0.1.407"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.407/veryfront-macos-arm64"
      sha256 "90ce20b8b2250755c3aabcf496c7276178395a12e242c446fdc0b7feb1463bbb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.407/veryfront-macos-x64"
      sha256 "df45dfdb327b65bc236e7e11842108f0fa22305852ba7b1a7a72f682e1462aff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.407/veryfront-linux-arm64"
      sha256 "17c858c963ec65b0ebcc310ab25a6e7d6a2b4a26495df0f77c53ab182aa064af"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.407/veryfront-linux-x64"
      sha256 "01fc63888576bc89078b6ae914d083fe44671738594c34886ea25641965e8e6b"
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
