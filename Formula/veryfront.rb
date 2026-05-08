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
  version "0.1.410"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.410/veryfront-macos-arm64"
      sha256 "820442ca0c4d4b5bc10f7cd4ba809ffce35b75dfed69bc247bac7d1705342b7c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.410/veryfront-macos-x64"
      sha256 "308eb9e673b5639fa28a6394d1de658e6d82a38b6de6b04a873186bca2ed8514"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.410/veryfront-linux-arm64"
      sha256 "a5e4d46ffa78f68099f58def2cac214094af305ea0899601913d24d5e1b575d3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.410/veryfront-linux-x64"
      sha256 "5ebc29cb3f0321bcc9fd5be4231bfcebaca577a00ebe22f9be5352cc1ee3f575"
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
