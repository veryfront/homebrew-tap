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
  version "0.1.470"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.470/veryfront-macos-arm64"
      sha256 "4b9c71d8d238618c8daf7a5567daa0b434c411552783015549e65483a0f226d6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.470/veryfront-macos-x64"
      sha256 "900aacf44ae9d66c7e85995aa896c78748bfd2059d4694573603a4376a8085c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.470/veryfront-linux-arm64"
      sha256 "402c5f99f0295b88971def5388245a6e6f46d35a22f6c6e81a9b002cec8eeed0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.470/veryfront-linux-x64"
      sha256 "668722eade91168e7372dd0b7abe6ce746376186b61c9d318746eb0c83152e06"
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
