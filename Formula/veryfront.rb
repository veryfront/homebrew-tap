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
  version "0.1.618"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.618/veryfront-macos-arm64"
      sha256 "e3e28e3751a4b067fbe00956eaed2d410ed8e4af02adf7918a04b30af4e8fe87"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.618/veryfront-macos-x64"
      sha256 "fbf45deb237895788716853653ab0747fc8ee42895ccfd1e4ce7c6bd0e7f6dc1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.618/veryfront-linux-arm64"
      sha256 "90c5f36de4c3acddf445563324bfc405e649df7777fdfa51d87ef739a348f07c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.618/veryfront-linux-x64"
      sha256 "82e3654dba4243f5c1ca93415d2f156a13479b23d03387640f455140cbca9c3f"
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
