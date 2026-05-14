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
  version "0.1.523"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.523/veryfront-macos-arm64"
      sha256 "efb1b4fdd7d14db0ab979e03adc5120f5117fbe99665313956c82be8c36e5116"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.523/veryfront-macos-x64"
      sha256 "9a45ca230e55a9cd069ea4f2d536126bbe65b25710f843780229b5b6875a4054"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.523/veryfront-linux-arm64"
      sha256 "89e3c4735010d45817aadaf66b03e8e5678ad411784169da93314a1c39c25d5a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.523/veryfront-linux-x64"
      sha256 "b4fad76741f1d90401a22dd0bda0a018fb7c4e91ce49a1b29ef6ad80e0a34030"
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
