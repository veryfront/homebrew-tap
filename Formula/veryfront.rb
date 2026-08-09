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
  version "0.1.1219"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1219/veryfront-macos-arm64"
      sha256 "956e6d754a77d818af043337154a1b86d4930d6b0d8acb4ed986246bcd59eae8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1219/veryfront-macos-x64"
      sha256 "94625d7237c84b85fb50daacbe9236b650b46d7f06263f44a8fc042bdd0ccb5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1219/veryfront-linux-arm64"
      sha256 "46153a694b782da4219de49681d24cc2bf3471966d747924e6b40ac40cd25bb0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1219/veryfront-linux-x64"
      sha256 "e1e2a771238552e3bf89ffdac22e35c337048ab28295940913191d0064dd5e8d"
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
