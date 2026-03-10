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
  version "0.1.52"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.52/veryfront-macos-arm64"
      sha256 "4405485f3d5f0ac51a1173dc1ccfd81304adfe9f9cee347614f5a9c16b3bf23a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.52/veryfront-macos-x64"
      sha256 "671fbef7011df45533282d6d946d38a69b652c6a9412e596de773a0f1392f812"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.52/veryfront-linux-arm64"
      sha256 "080d4eea9a24fb65d3af2fdabd799e1d526d991876ab68b86ce5e33ebec3eeaf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.52/veryfront-linux-x64"
      sha256 "ae6c5193de8077a90d64e8449ec6a9ceb408d628a5242fb76336fa77e7f31571"
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
