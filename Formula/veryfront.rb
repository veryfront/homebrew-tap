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
  version "0.1.800"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.800/veryfront-macos-arm64"
      sha256 "5eb9ad152dfa3f3aa1619998d7f31a83aa1ecb74ce4dec6b7ce586524ed46da2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.800/veryfront-macos-x64"
      sha256 "4c473815a2218bb7d0efa11f56047443d9175a5ce43f774031b6d61b1d7bcd0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.800/veryfront-linux-arm64"
      sha256 "e27b910455456c2c2018a935529e68a6514fa958abaddee97919173e16358dff"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.800/veryfront-linux-x64"
      sha256 "99c254c82285e6087ab75e2b044fcf09a611851ef6765556a72aded452015d45"
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
