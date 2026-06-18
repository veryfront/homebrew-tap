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
  version "0.1.856"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.856/veryfront-macos-arm64"
      sha256 "03ebf8a40af1aa742042ff4d33288d0cd6cf9f33ef8bd8a0a3a24aabdfa5c8b1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.856/veryfront-macos-x64"
      sha256 "9d56d2cf937427c6c958ca4803de27be1a731e0de4fa479e2cb0fec391eb7b14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.856/veryfront-linux-arm64"
      sha256 "bb7a217edd756237e17fd6277d7848cf94297c08fe3aa136d55a4ba5b9d95dc1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.856/veryfront-linux-x64"
      sha256 "173f129867956df3834df1af92fc4188c10932bdfb4ef53e41a7f79c7355fbb6"
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
