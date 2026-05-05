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
  version "0.1.385"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.385/veryfront-macos-arm64"
      sha256 "91a10a735a821a2a8751014afab3e28d8bdd74640ab06c88fe51d9dd09a7ab12"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.385/veryfront-macos-x64"
      sha256 "9276ab0802f0d690a91f3c8e47cc13406e5a81e33e7fbb3632d7cdb0ae1e7462"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.385/veryfront-linux-arm64"
      sha256 "bc6b767095360d169d70670fb41707b4bfdf014375daaca3854496917429c2b7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.385/veryfront-linux-x64"
      sha256 "5a63efcd3b6d634943b7f25e6422235e493c321bc83f2eac91e21fabab32a126"
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
