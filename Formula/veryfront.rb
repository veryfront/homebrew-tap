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
  version "0.1.507"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.507/veryfront-macos-arm64"
      sha256 "6dc0f185d4811691a3a4285a4ac2eafc246ec8c5cd1c57665ace32912d51712e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.507/veryfront-macos-x64"
      sha256 "e278cdb7d88c780d184e9e50a0601f18c670b5cf65901a747800baf6b2ad9cb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.507/veryfront-linux-arm64"
      sha256 "ea983d17cc97c88b7ed7c31cc615f73024d89901b08b524e19a3b2f70993f2fd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.507/veryfront-linux-x64"
      sha256 "b865bb2c926274211ba24853928045ac86ea8f42f2ba7c217020b05a492a3ed8"
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
