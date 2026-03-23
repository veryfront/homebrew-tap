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
  version "0.1.97"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.97/veryfront-macos-arm64"
      sha256 "df8f431b2450ab55270f86c4d5e492ff55c88060f3ef3850a58c689c2ce3c26f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.97/veryfront-macos-x64"
      sha256 "11f9786125e6c398e3497124edf984381ef6ab66eebe180ac28835650a2b54d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.97/veryfront-linux-arm64"
      sha256 "e9e749fa971c2fe1e9e5cdc0a32f5daa38c217f6bc49b2e9fcd4dfb238745553"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.97/veryfront-linux-x64"
      sha256 "7c3e4e981f6caaea39d41b9cb1c06d658efc5dd80b097f9145c7740478ee6c88"
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
