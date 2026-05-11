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
  version "0.1.478"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.478/veryfront-macos-arm64"
      sha256 "b9d564c832ab4cc1edd7ee7b290b80a5308d956cbe84fb02d3a4c3ccc7123639"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.478/veryfront-macos-x64"
      sha256 "75f75ac591c24d2381ee81bdfb21efda93bd7aeed0a1761fd722abbc39dd1bd5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.478/veryfront-linux-arm64"
      sha256 "2f90b1a61bf8034a461fd0d8f3db0b2bfa061501c8b949ef6b19b9979ffd9e61"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.478/veryfront-linux-x64"
      sha256 "39807cf129fcb8bee3b4bfd9e649c0f796a6154c3e717c9de85b3b0691cd3cfd"
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
