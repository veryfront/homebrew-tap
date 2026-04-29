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
  version "0.1.319"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.319/veryfront-macos-arm64"
      sha256 "c9c8a6b3b9c7be59aad83b28b68be071ffd18d6cb926ccc10b689ac0346a8b18"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.319/veryfront-macos-x64"
      sha256 "0b4c932ed7a2dac3a20c6478ac4383e96e426c38cd11b7afe79e893776b00720"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.319/veryfront-linux-arm64"
      sha256 "cda73616d0303dc8275dbd08981f49e3fad4dd0b0210735e7f30457967281ab5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.319/veryfront-linux-x64"
      sha256 "07cb56845956ea95eddc3ec886302caeb28c5efcbc4b98870c7acb2c696c5ef9"
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
