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
  version "0.1.1047"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1047/veryfront-macos-arm64"
      sha256 "4dece0c743124e5cdaa54ea69c24a1be35ca0ef6d600a6db2e117b81083f3500"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1047/veryfront-macos-x64"
      sha256 "cef76c8219d74cc10c71aec7c04cd69039931be72d581b2fbdba3f59f2b135c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1047/veryfront-linux-arm64"
      sha256 "fb1c01aa654f6dc3e4f5bf28e3217685af877ec79778558b6b94ec35c96bc14d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1047/veryfront-linux-x64"
      sha256 "7b1a31ce991465b2ff0c51b14f0bee1bbb7e6d84833a469fe4b0c2a00696bc2d"
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
