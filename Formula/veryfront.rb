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
  version "0.1.923"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.923/veryfront-macos-arm64"
      sha256 "270d77e0e9857f91c26683e40d5790714710377d0b539c9fd3bffbeaa4fd1815"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.923/veryfront-macos-x64"
      sha256 "dc85bc9507cf67ca2fe5022e525c6f9fe8acb072165ddfc01a379dacf31d1c7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.923/veryfront-linux-arm64"
      sha256 "1e54f93353ef22fcea065c4177436f4b53555984bd2bba8edfb587f0893d8fb9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.923/veryfront-linux-x64"
      sha256 "d5babb7b59c73601b3d2ea1bf3b70841f68c4a8877e5357c888c09e58218dd70"
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
