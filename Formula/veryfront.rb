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
  version "0.1.462"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.462/veryfront-macos-arm64"
      sha256 "e20f5940e258a0d8f1256a16b3362e9c948fa1cb9f67cd9c8866a54310605098"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.462/veryfront-macos-x64"
      sha256 "48ceb028cb5035aa867cdebae61fa6153b55918acc0ab4a6b67351d61250146c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.462/veryfront-linux-arm64"
      sha256 "3cf52f7514bf7dcbc786fc0511b8de12dfa21f64629618d9e02836414095e175"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.462/veryfront-linux-x64"
      sha256 "8d2b093add55ec1d2abba50da3af46f60f48c813cace5d36982ef77ecc3bf2da"
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
