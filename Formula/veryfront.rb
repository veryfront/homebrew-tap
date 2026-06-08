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
  version "0.1.687"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.687/veryfront-macos-arm64"
      sha256 "24480c2cfbb80d2a36c0a7c29855c42474671721dcb7fe9d102e1b36a5af131e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.687/veryfront-macos-x64"
      sha256 "a78160798202b7a0971f21964f7a6d198251c0f01358715b02acfdc709d0684f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.687/veryfront-linux-arm64"
      sha256 "6f916e612619bab234c96042963967c8e7ea8f1e71902f92d03622c3a23437e7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.687/veryfront-linux-x64"
      sha256 "37627cc010ae7935990d3f425d862ad782ec7ee242a28d1b689ea93d42213541"
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
