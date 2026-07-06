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
  version "0.1.1022"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1022/veryfront-macos-arm64"
      sha256 "ecb6e2dfe395476f1381714150ad186e3747d622e8cec52276e1feedfce009fe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1022/veryfront-macos-x64"
      sha256 "452f3f85f7968273e9af38b367eccae0476a1a220b84bdbe6bb4bd2185b532b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1022/veryfront-linux-arm64"
      sha256 "a1c0a8dbafc4ddd90a904820d1e7f4f3a7d303c68cd0ac7ed5c0ab0fe972f4c6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1022/veryfront-linux-x64"
      sha256 "085d8d41000d9c310dcb56702bcf31ebdbd2505bf2106f98f411b5c08bbe907b"
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
