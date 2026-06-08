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
  version "0.1.686"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.686/veryfront-macos-arm64"
      sha256 "4cf2503f1eb284c534726dff4fe6805eb928a4bab3e3d0ee13a88f924ede1ad4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.686/veryfront-macos-x64"
      sha256 "29c4f4e2a5ae6e51d06439758e32fe4e5608938af97d97437925092e36b0bdb9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.686/veryfront-linux-arm64"
      sha256 "b2a410c8ec20b897ebd2ac5c23746b1592b105556e928c4079b49db8d96a26e9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.686/veryfront-linux-x64"
      sha256 "2da018dde54d61873247f2cb263d6a0ef156b619822259abb0f6b1f9e2aa1eb8"
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
