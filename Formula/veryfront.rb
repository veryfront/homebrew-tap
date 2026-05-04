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
  version "0.1.370"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.370/veryfront-macos-arm64"
      sha256 "0f2ee610eb6a136c8fb0a245757e70eba2e62f27b39a3b6834fdd34917e10dd6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.370/veryfront-macos-x64"
      sha256 "3a5495692f8f75a22033f434ad8dcab01db3ee30624efb0d06d382c629db2d01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.370/veryfront-linux-arm64"
      sha256 "b2e44df65067a312f08ddf6546c4654d94ad5ec410ab5e5a1256d6c19f113dc5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.370/veryfront-linux-x64"
      sha256 "822d2b6cd05430f13a17826aad61a8e74f40fa97412800214aedb66778e2db70"
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
