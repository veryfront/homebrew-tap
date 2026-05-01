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
  version "0.1.351"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.351/veryfront-macos-arm64"
      sha256 "8694fe4cd7ff3f2f582294a77853f10e2ae89b74edd049f6bfb5229a9e513998"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.351/veryfront-macos-x64"
      sha256 "ed72e77148cec645300b1d39533757a29439c8c31832cd3f95858fd89643cc17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.351/veryfront-linux-arm64"
      sha256 "dcab4e4e6f9a03eda449ffa2a0047f37c7d79e63c9dfd9d81a9781b8158bff47"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.351/veryfront-linux-x64"
      sha256 "afaa605f2e71679abaf6544edb308b3a84d047374fb7facd15d612096dce559d"
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
