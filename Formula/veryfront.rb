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
  version "0.1.469"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.469/veryfront-macos-arm64"
      sha256 "b86b03586b3a85e06c0ce33d552bf7c050d0c8257da0cf65ace17c983ca84979"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.469/veryfront-macos-x64"
      sha256 "f77c0d1b56c17b30383ac4b90f6d72ede2bedf52d33e137f959ebf1f3c8f074d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.469/veryfront-linux-arm64"
      sha256 "6912d9e88e783f4119d06d6ae9d7911216e1813e012a39256938f28b6a48dde6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.469/veryfront-linux-x64"
      sha256 "ffe7750fd39dfba75d840adaeef3875ab4bd8a8d49e6e9c2358b1d58d3a3057d"
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
