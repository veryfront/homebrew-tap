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
  version "0.1.1226"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1226/veryfront-macos-arm64"
      sha256 "338fb6f98c0c1188e2e67b94141dac8b5ba46170cb8b699e2ae1589d769fd1ec"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1226/veryfront-macos-x64"
      sha256 "aa941204c4cd02f51752fea7e1a522a0f690db26a7faf8206892fcf0fb6f404d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1226/veryfront-linux-arm64"
      sha256 "31c14e8e420dd0e8e503ddc6df12f1f3dc02ce1bf8e9891b2d490ee83f8e579e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1226/veryfront-linux-x64"
      sha256 "125e79818a7bc4dfb685837b2eccc331f37c20fca77b2fb1eb4bd7d7e315701a"
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
