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
  version "0.1.173"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.173/veryfront-macos-arm64"
      sha256 "3eb1ca934a4a3cdc3a649b054a2a316d9ba59fc5c6cebc74a3f4914183128fe6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.173/veryfront-macos-x64"
      sha256 "bd39575235ed0b58a69efc88b92fdddbddc728127828ed16ae62478d171423b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.173/veryfront-linux-arm64"
      sha256 "6ab43725419272001fa41037eadd38b45da0d6193dbe2195055fdb128879d489"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.173/veryfront-linux-x64"
      sha256 "3b4d918bca094ba47341b95d62970223638dc69cb229b6b4f9886561ba98d95a"
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
