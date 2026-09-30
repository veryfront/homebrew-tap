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
  version "0.1.1269"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1269/veryfront-macos-arm64"
      sha256 "eca444b21529461e74033d646cc48ed5183a23b4f0e77488eb2e70f9e317c9c9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1269/veryfront-macos-x64"
      sha256 "27638f084b5a0f8b68818da00f0e369f1273d40d055a54ec02c7d30a51a67a16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1269/veryfront-linux-arm64"
      sha256 "5210bee5988768054ec650b4fc75baddadb44b317f86751ea65c73dfab6bd738"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1269/veryfront-linux-x64"
      sha256 "d3d61abc1b141a81481d8e5158da03088ba9bec03871b49e44b7eb0dbf7e8379"
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
