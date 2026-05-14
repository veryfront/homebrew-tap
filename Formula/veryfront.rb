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
  version "0.1.518"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.518/veryfront-macos-arm64"
      sha256 "cd706d45d5991a406d3e09f92f5a0ae1f10387820d6560588cb6cdf72318a231"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.518/veryfront-macos-x64"
      sha256 "b183e58415c5d8647566830c3ef107a514afde38b9d6a2b4551e71dfd2fcf5ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.518/veryfront-linux-arm64"
      sha256 "05531c73dc485413c49c3247e50f53415473b41e03f47411e5392c1bdb9335cd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.518/veryfront-linux-x64"
      sha256 "d541aeba4320b79df0fe3f73ca61532f7b93a0a0d1b431b282fe7259595d7d46"
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
