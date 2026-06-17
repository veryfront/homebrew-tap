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
  version "0.1.833"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.833/veryfront-macos-arm64"
      sha256 "7ea4d29f644d3506bbd2b19d27b8bcd30ddfab127171c9025941860c18f40cad"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.833/veryfront-macos-x64"
      sha256 "096da02140e5d3152b1df305dfff6858c14f00b80a0433e73bc6acb07b20efd4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.833/veryfront-linux-arm64"
      sha256 "9bfcd4ce38b0a5be28a791ada28c38457d832edd900253bd2823027fed05d3c5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.833/veryfront-linux-x64"
      sha256 "3a084177978dd74b17de6df2976a194618a6c4ea496dc68bee814f86dd864bc0"
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
