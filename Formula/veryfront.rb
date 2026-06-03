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
  version "0.1.651"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.651/veryfront-macos-arm64"
      sha256 "fd80bd0504e7470e46cbf31b89a54a1e3a5211830c9a1d804ca6deee3e460c47"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.651/veryfront-macos-x64"
      sha256 "4ceb6c1af5f9fe3afd57cf01dd9ea8c4d2da1fed0dd3641f899d6f606b140b51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.651/veryfront-linux-arm64"
      sha256 "1e25b7b2f73593b665e41b012fa2e6033f6ea8c729a2e875c9c38d5b2b9d5ae9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.651/veryfront-linux-x64"
      sha256 "3659d3d957d4c0d763feef4d127047d0d3061c42eaf914fa385f501a71b47b9b"
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
