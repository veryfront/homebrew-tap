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
  version "0.1.1035"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1035/veryfront-macos-arm64"
      sha256 "1a75c384af95421b09507694dccd13ffe90c61fee2a473bddc97afeb65dbcf36"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1035/veryfront-macos-x64"
      sha256 "84230d636243246cb61916881ab20f1c22dbf3f03fd653031158dec10c9d5c07"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1035/veryfront-linux-arm64"
      sha256 "793340b91eb38eb77f7be3f5f86b0aad055c92020abf2b912fbc31feccc699ca"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1035/veryfront-linux-x64"
      sha256 "dc7f833877634283fef288bce7f778a6851e2bd68564cf221a28c87716c50f2b"
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
