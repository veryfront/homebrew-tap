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
  version "0.1.434"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.434/veryfront-macos-arm64"
      sha256 "cccd00b99230d63df5d282522c8154e14dc43bb0fbd73185bb77f842816fec62"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.434/veryfront-macos-x64"
      sha256 "0e6b0614386c504eee917003d7461c6931e486dd79afadf97f098b7315629487"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.434/veryfront-linux-arm64"
      sha256 "60aa72d7709c9559f0d69c6f57a4ad3a28a9b1272331d1739fccedc1c8f96ac1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.434/veryfront-linux-x64"
      sha256 "d88bdcf03f7dfec56424be68967d6cecb370320ddcf50a1855d8c958522cbdf5"
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
