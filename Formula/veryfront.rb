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
  version "0.1.1205"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1205/veryfront-macos-arm64"
      sha256 "2e5d3396b86838766bfcb11d97216c30fdfe4246bf03f54190a086ba80911182"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1205/veryfront-macos-x64"
      sha256 "d519f41ca9967e5bdffa15bb825d392522e067b88b6af1ac18fbaa023384b92e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1205/veryfront-linux-arm64"
      sha256 "9219c5c493db26395092e3ff0a635bf038fe6e0751303ac34d5b3d57190849eb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1205/veryfront-linux-x64"
      sha256 "1b0435528616ad27fb588dcc4b5c7889b71c97234b9929aa5816ecfce746371f"
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
