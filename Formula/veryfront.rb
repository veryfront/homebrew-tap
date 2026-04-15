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
  version "0.1.209"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.209/veryfront-macos-arm64"
      sha256 "bb587fea92d29563a0ac4f2c429b455af60670ddaac04476140d8751f1bcc087"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.209/veryfront-macos-x64"
      sha256 "31335ccda72f06e57dc5919a24d21339e84950d2064cdfd851b9576a04e27c2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.209/veryfront-linux-arm64"
      sha256 "697aede40679d252096ef267033980b4e3b8de85c894f8fc9df10c2fd6429e11"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.209/veryfront-linux-x64"
      sha256 "1f5b56ae83bece99c48c56cd90dec7a95cac61a9a8fdd66f332bf22f8148afad"
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
