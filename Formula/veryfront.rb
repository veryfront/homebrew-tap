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
  version "0.1.212"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.212/veryfront-macos-arm64"
      sha256 "fa77cdaa575d3bfa002fc5e88911df31e425c77cde4ec7260e0fe7ac587e691e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.212/veryfront-macos-x64"
      sha256 "ce3872a9079414c0ccf70abe1005c30a01beb44c51924a7e6177a050ee2d3405"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.212/veryfront-linux-arm64"
      sha256 "fea2e488d8d5839496ea92dc6eba3b10ad71f053c4013eb21492a45b5480ca7d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.212/veryfront-linux-x64"
      sha256 "fa53005a6a9baa38eaaf6a7da67aa48d3746baf41e11355c4f55faa4cb8c7396"
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
