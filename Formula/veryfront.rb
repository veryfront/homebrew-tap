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
  version "0.1.664"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.664/veryfront-macos-arm64"
      sha256 "43cd39f4e148bec5213c14dfc50b671e180dd078c775260c4f744a79fa26561d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.664/veryfront-macos-x64"
      sha256 "38a98bab711b568c8b9cbde975f4a577519ad45e9d0b4b0220031ff5683af234"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.664/veryfront-linux-arm64"
      sha256 "9e9b3b8343683b2bccaad51273f8a3bc8e3eab133d7d0df15c488210b8a1f9e2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.664/veryfront-linux-x64"
      sha256 "b5803c508d818e655b9cb14218d6d2355ff7f8f715cbb33f5719a7b7f175dad0"
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
