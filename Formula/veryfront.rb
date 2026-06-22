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
  version "0.1.909"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.909/veryfront-macos-arm64"
      sha256 "456572b5d7e6c70dd25271ab7014deecb5b74eefa0e2027673a7ed89ce81c921"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.909/veryfront-macos-x64"
      sha256 "5d82912abcd61d653ec0228533a96c10406638a7d9350931375ef04ea3389193"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.909/veryfront-linux-arm64"
      sha256 "704c06132bab2fd0d58055fb3f82a18902a6e44da93fdd76497b4902e989c5be"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.909/veryfront-linux-x64"
      sha256 "a4e5aad943678d5fcb37a1443172ef0a8dd1a279282008470cf671afc898464c"
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
