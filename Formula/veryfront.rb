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
  version "0.1.390"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.390/veryfront-macos-arm64"
      sha256 "407e3db41f03378e078e5453676e0a16b10a3fba0ddb00d6d46d88f2b4401b22"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.390/veryfront-macos-x64"
      sha256 "a9c8ed41f847daaba68010be0a9de6de39dc06f8e942ed587fcc54e5f37d9af9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.390/veryfront-linux-arm64"
      sha256 "fcd43ce602c50f112bfc614c0a08d3c4418d1e4e3601b09dfb5d1c44b1568edd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.390/veryfront-linux-x64"
      sha256 "51aff27ca0e118ceaaa2a9e0799af515454105c6f4b744f20bb8ff8fd0ae4e70"
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
