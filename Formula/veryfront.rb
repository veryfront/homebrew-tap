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
  version "0.1.1248"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1248/veryfront-macos-arm64"
      sha256 "72a9e6983d87eb76a0b029df8687d743e44f2cabfb2d1d4b2ed0a06d77e5c6ed"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1248/veryfront-macos-x64"
      sha256 "fb13682110d16ad199d75793065516ee40058d956d2ad2b141596f8675d28218"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1248/veryfront-linux-arm64"
      sha256 "945fcb001c99caec565161ad63cc34e1628e11ce35a9dd748b76fff959e21e18"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1248/veryfront-linux-x64"
      sha256 "6360d033ca450d79d6306188763647d7cdabf7448baebb31b317690194dc76df"
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
