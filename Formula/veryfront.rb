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
  version "0.1.279"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.279/veryfront-macos-arm64"
      sha256 "c7b7041c2fbaace921f0631ef887d0a32c75fbb1d855b153297e9d2a7722f626"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.279/veryfront-macos-x64"
      sha256 "95f8a6dcbad47a9c6d1b0ebc0e37f3b5828b2a679c7d46168ea2214be83e93ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.279/veryfront-linux-arm64"
      sha256 "4ce010c4cea77c319e7d671ebed3c2cdbd3e47fa8f87db2a36cc56a2ccc2348c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.279/veryfront-linux-x64"
      sha256 "9719114bc2460467a06e8ac9831f3ccd251830c32a662c49a48fbf8dfeac9114"
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
