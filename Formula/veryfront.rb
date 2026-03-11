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
  version "0.1.57"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.57/veryfront-macos-arm64"
      sha256 "0d253f6e315c476989ff631276e5dc87263a7602cddd3b9e39d7206f4a85456e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.57/veryfront-macos-x64"
      sha256 "c9402d0f5db0d9352ce2b0b9b2a7a6d0c8044739a152c56cd103bce5e19c7857"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.57/veryfront-linux-arm64"
      sha256 "78c8b42e0ab6b091223a26bde104b088c45f0f7c1ec1b80a774188ba9e4ef93a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.57/veryfront-linux-x64"
      sha256 "704734f6cc0fb96cf906ee9f80c3b4b74b4684ff02fe64b3f685abfcc2bf6a1a"
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
