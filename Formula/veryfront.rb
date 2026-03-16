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
  version "0.1.71"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.71/veryfront-macos-arm64"
      sha256 "27f2d72e03fa7d2c3209cc07b36d84420679e05b82e8da1c0b7bdb5c9165f1ee"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.71/veryfront-macos-x64"
      sha256 "67d945e42fc32a037096a7060d2e59c264305a38828e574a25b10887d9fea41e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.71/veryfront-linux-arm64"
      sha256 "e0afea2dd7787ef6c2986ca691d6e1ce1e47bd76796b834a4f4cd309246c623c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.71/veryfront-linux-x64"
      sha256 "0f02e3ed14dcba590ddfb70a58d0757ba2d693de29b7fad7ba0da899c099025a"
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
