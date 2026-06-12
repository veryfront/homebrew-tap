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
  version "0.1.768"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.768/veryfront-macos-arm64"
      sha256 "a8b6f84b01d3010fa1991182b08843d08665be22642ebdec8a99b734d650e2ca"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.768/veryfront-macos-x64"
      sha256 "8119bf5eaebab7d1df920d210d6448751b4fbbc35842913a7ac642c23d8393dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.768/veryfront-linux-arm64"
      sha256 "05441b84e460b8ba10236d67d92342fe336fd08332e21a309692bedb3d4a598a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.768/veryfront-linux-x64"
      sha256 "bcdf268805c76397f760e49c9a7053728a17e122371b6cd91ed2e5e31f7b863d"
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
