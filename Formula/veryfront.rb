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
  version "0.1.956"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.956/veryfront-macos-arm64"
      sha256 "c6dfacbfab0ffc811b97d769a7acd828e6e97fc22a0d9972f523772e6c5ae20f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.956/veryfront-macos-x64"
      sha256 "c2d59f8f0a0139f7d935149817daaaa951638fba2cf48fa05aa689c4310d47f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.956/veryfront-linux-arm64"
      sha256 "5ed205a2d597551047871e849c9d6009966e6c09d7c698d9f35bceaeaf7cb00d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.956/veryfront-linux-x64"
      sha256 "321a7774d85822734b0516afe9c05ed506b09c3dd6870f1d9e0730f8f192a340"
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
