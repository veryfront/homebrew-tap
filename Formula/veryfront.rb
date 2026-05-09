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
  version "0.1.448"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.448/veryfront-macos-arm64"
      sha256 "bd28be87e6e6ad25b78c706d499238c2f403a112b07a940832d3af87902a16d3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.448/veryfront-macos-x64"
      sha256 "4d76f47a274a4ce14e7f76560c8fa530c2c0a64b912a7605d106ea917488807e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.448/veryfront-linux-arm64"
      sha256 "29e317fbb77f90a91d14e5996862560f9d54ca4cd557eba8b2c6aa680abdaf0c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.448/veryfront-linux-x64"
      sha256 "c07263715587d2ca5e812c63cdf7ac562d633705a76b0067efa33100ca3a37d9"
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
