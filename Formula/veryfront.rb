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
  version "0.1.391"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.391/veryfront-macos-arm64"
      sha256 "b671ae889ec84337e47446b1a84a5739b02aa4e3609a372d94aed5685f2d14a2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.391/veryfront-macos-x64"
      sha256 "85a3300d331aeba15188a2451ce9f2b574b76b94ec6730223fb30b16f49d0b30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.391/veryfront-linux-arm64"
      sha256 "1766ef3224845aff8918c857dcbbdf9e101b072f28caf2a1ec9dceac86a9624c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.391/veryfront-linux-x64"
      sha256 "85b4051f15eda870041230815c8339c6f432e9a2fb649e3d3c75cfabdf8e2f3e"
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
