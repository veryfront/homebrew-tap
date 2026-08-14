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
  version "0.1.1235"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1235/veryfront-macos-arm64"
      sha256 "ff0fed07e91d148b80b0dd692afe8141a0f7f654762273986eb75e4945e4a6e2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1235/veryfront-macos-x64"
      sha256 "93cb3456b054fb4a5b9abb9fc70b8f263f8b008678b2eca18b8e9424350d88c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1235/veryfront-linux-arm64"
      sha256 "1a297585ad3946b9448f6a539e56f67721d70dd417ae5535c815724e4363b760"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1235/veryfront-linux-x64"
      sha256 "15ad525816bd849969773eeda8a8962cbb70cef8a16607f3644ccb2cbd580456"
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
