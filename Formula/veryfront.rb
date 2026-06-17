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
  version "0.1.842"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.842/veryfront-macos-arm64"
      sha256 "8b691fabcdccc68ec4ddcb31f59a853366edf58acf1c54494ac1d7205a2cedb7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.842/veryfront-macos-x64"
      sha256 "f5557bb848f631541e6827bd388c160b7cfbb2b1ab3c7592cc19f4637fb93d93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.842/veryfront-linux-arm64"
      sha256 "f731de2f18cfa39442597916105294aa186902f65de484eb07b5fa9f3dd6a0ea"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.842/veryfront-linux-x64"
      sha256 "6573ad00c388960e58daded680a6b1e719360a2effbca9c9404c575e00d2bd29"
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
