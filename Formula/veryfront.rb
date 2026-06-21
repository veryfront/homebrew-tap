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
  version "0.1.886"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.886/veryfront-macos-arm64"
      sha256 "a1b0a7401e4f43a7eb4575661b7721a184ffedc47bfdfa997dff16a8eb7a2fed"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.886/veryfront-macos-x64"
      sha256 "fe93f974f5bdd578a1d90b45d9164ee8f1d70259e23b0aadf7871c0e1e449f38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.886/veryfront-linux-arm64"
      sha256 "72f2dfe6469c946c52b45e5f84956293534cf1b410c82659f8ec5b71679d5561"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.886/veryfront-linux-x64"
      sha256 "e5bc2d2aba464674256d6a2905e107b47558631b9b445ce7379e4fd2faf428a5"
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
