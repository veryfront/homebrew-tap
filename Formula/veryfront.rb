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
  version "0.1.503"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.503/veryfront-macos-arm64"
      sha256 "e238736a94f4ea806205ca940e7e5f77250df4cf768c5ae82a855640ae18fd0c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.503/veryfront-macos-x64"
      sha256 "2a62240aa487393bc77c102de3a1b8ead82544fe0799fc9571509a1c253b2c34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.503/veryfront-linux-arm64"
      sha256 "9cbece04a64f862c610f74f05a4dad59ca1ac93d4ad236687612d2b66bc9d7b4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.503/veryfront-linux-x64"
      sha256 "cd7d433ee30c4b59a87ec360b57fb46e003cc3a683435f640e9d33943df6d5f3"
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
