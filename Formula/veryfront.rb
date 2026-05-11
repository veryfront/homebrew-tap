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
  version "0.1.480"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.480/veryfront-macos-arm64"
      sha256 "556858bacbdf33868be87f24cccdc59991da37ed6e339cd5d8a1ed60f1217ef3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.480/veryfront-macos-x64"
      sha256 "10c1563fd5f867903556edd668fb0a4926871ec60f1b273fd92d5bb9aab73e4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.480/veryfront-linux-arm64"
      sha256 "5eda47cd38a4e124ed6a4cca92363b78dfeb7c963a54da5d65df96b374c05707"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.480/veryfront-linux-x64"
      sha256 "cf6b625d5b37bb2540331be87508f07022a9f7bdd73fe90df63a70645064bac7"
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
