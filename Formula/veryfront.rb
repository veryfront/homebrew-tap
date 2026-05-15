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
  version "0.1.532"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.532/veryfront-macos-arm64"
      sha256 "c22b7a2783e548990bee4bdfaed63a0cb1b1fe5330482d31ab3b232730f9c017"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.532/veryfront-macos-x64"
      sha256 "cb7f7f9d93ca38c722b1a799012324f17c5ba49ba5e3b722494418ece1a1f31a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.532/veryfront-linux-arm64"
      sha256 "abeb09d1119f472570115a35f0188fde9b412b5272114e5b033145512d248966"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.532/veryfront-linux-x64"
      sha256 "b4eb21c2c09102efc5318ee0b2e679a89f0a51c48daabe10d9d6a8f7b7fa1090"
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
