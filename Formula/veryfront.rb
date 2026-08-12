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
  version "0.1.1230"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1230/veryfront-macos-arm64"
      sha256 "01c035ae24762e7b2f5102e9cc84670527f3d230eab016569ad536c71fcc2345"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1230/veryfront-macos-x64"
      sha256 "e876ccd98d6fb28de473ecc0385752dcbbd40ee0ca5e37104637c55f53770223"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1230/veryfront-linux-arm64"
      sha256 "0921b82e3f7a111d105b451ccec78518b5d534ac71163505d9579640aaccf219"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1230/veryfront-linux-x64"
      sha256 "e348a0757e3e46ac30079b0b249f5700834b2d664614665cce4dd06c9ba35243"
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
