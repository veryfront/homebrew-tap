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
  version "0.1.249"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.249/veryfront-macos-arm64"
      sha256 "d01e0e097023da9d97eec7b059596fecd071dec220f7475f4238c54e56cfe466"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.249/veryfront-macos-x64"
      sha256 "bdf43600b0324ef1923ddd00f3d91773c8260b05f4b1d558e2e70d0ec750887b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.249/veryfront-linux-arm64"
      sha256 "94e991a76ae0c28b2792bfebeb9068abf8489f513be56cabd541531f24fddc0c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.249/veryfront-linux-x64"
      sha256 "20f9bc3b03fca4274a413595e3680f73100de7dd4e7406a0f113f3be66654086"
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
