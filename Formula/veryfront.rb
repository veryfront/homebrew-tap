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
  version "0.1.268"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.268/veryfront-macos-arm64"
      sha256 "96edebd5672db6125a52178a9165a06faa2ae04189e9c0e7dee8492fe96bec29"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.268/veryfront-macos-x64"
      sha256 "b39b4eb18ee7490205e37243b5bfdefc96a5741fe12ac577c4ba5b32b536ad98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.268/veryfront-linux-arm64"
      sha256 "bae0e1d966664a6ad4cb621340201dc565ee3259b2cd33efce636b3c4c2faaa1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.268/veryfront-linux-x64"
      sha256 "2604ccf2c1ff631f76d8208226e983e4b88fbefc75d452ccff8572bf42b23d93"
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
