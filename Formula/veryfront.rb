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
  version "0.1.1151"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1151/veryfront-macos-arm64"
      sha256 "6c54fd1e71a750a3c173eee058cde6d7efae93c837f86fbd637c1cc1484ce665"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1151/veryfront-macos-x64"
      sha256 "3a706740a1513fd4dac98f7d04365e9896048c1df34d0487a40b432febb62571"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1151/veryfront-linux-arm64"
      sha256 "dcb288a8d8be7867441ef081d2a9bec9a12066434a7e312ebb2bf3c872231cbf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1151/veryfront-linux-x64"
      sha256 "683bb564fe14f8636f98651c8c778202d90da6f0a960ca039ab29e51949a984c"
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
