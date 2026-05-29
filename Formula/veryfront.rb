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
  version "0.1.614"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.614/veryfront-macos-arm64"
      sha256 "2311bb5880a7414f87961f9a8994b1fbc8f94d155a75cc86b1b36074cb8d083b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.614/veryfront-macos-x64"
      sha256 "2b631ba37a0bfaafefc696f3fd8299b27d03a255422f931f48be88da010cf84c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.614/veryfront-linux-arm64"
      sha256 "e8b41b161392d8956f94a94005c6c328fe5620e78089272777d22007aa496afe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.614/veryfront-linux-x64"
      sha256 "160a95464490d1a421a967059441de04a99b4a0d7359657693419f2a35fb6eb6"
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
