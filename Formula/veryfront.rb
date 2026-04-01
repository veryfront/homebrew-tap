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
  version "0.1.121"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.121/veryfront-macos-arm64"
      sha256 "57cd421ecf56ff70a02f24a374db75982d9a3d4d56883dc07e9be5cdeac23354"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.121/veryfront-macos-x64"
      sha256 "7cb2601ed61264a80e9b7701ba05909e3cea31a6eb95828fd8c0c5d606e2ef34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.121/veryfront-linux-arm64"
      sha256 "32a1efbeae28e000bc27f8834e878f255fac61c1c30b3269802a5e7cfc64aa67"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.121/veryfront-linux-x64"
      sha256 "6b84028e0a20b0ecd7424a5bd027844956cc2fdef02673aa9b5c1b8aa1fd8b27"
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
