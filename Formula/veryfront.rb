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
  version "0.1.36"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.36/veryfront-macos-arm64"
      sha256 "36a8c04d95eb7891099251375db2047f09f2cef66e3ae10e3e722fe209a1151d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.36/veryfront-macos-x64"
      sha256 "c48b710d0bc0a0ff64325ee2f43b69d1effcb35b589000ef6957117d2650eb9a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.36/veryfront-linux-arm64"
      sha256 "062bad4c82eef93af3cc556609ae9fa0ac98432abc599ff2237b5e7401f87b41"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.36/veryfront-linux-x64"
      sha256 "b84f96869defebf30066ae4d6cbbc79e4aa3a763625674594954bbd8fcd18814"
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
