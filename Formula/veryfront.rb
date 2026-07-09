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
  version "0.1.1040"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1040/veryfront-macos-arm64"
      sha256 "b7fc2a095f12b8217d16681c2f8d49bea41955f5dafc9b884d696469ee69f966"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1040/veryfront-macos-x64"
      sha256 "4bd8dc63c5b09d441edbd52a80f93b786a6370165e4aae96bfe93a84ec92b87d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1040/veryfront-linux-arm64"
      sha256 "17b306469b6e2e23f1e868b819131d088706ac28bd93a85eec6e6b62d2073b11"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1040/veryfront-linux-x64"
      sha256 "1444230d6d50a9d4b4c874fcc4f6381e5893273112c6f92833471c3f68cfcbe0"
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
