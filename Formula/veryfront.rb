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
  version "0.1.899"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.899/veryfront-macos-arm64"
      sha256 "422bbc5d0b1e68b90e886c4ec13ae97c615be7e6afef79e80d71b9d09e76012e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.899/veryfront-macos-x64"
      sha256 "b992a6b7e7971889b640bc75cf35ebd73dacf78da139dc10ad8c1255e755d954"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.899/veryfront-linux-arm64"
      sha256 "ef2262e2bd893efff2561f0602179522be15821f2eed5727953a6bc784dec856"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.899/veryfront-linux-x64"
      sha256 "a32b845b0d2b155b9a394a98803d81b152e658663e3081a6466893d473bc5b53"
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
