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
  version "0.1.517"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.517/veryfront-macos-arm64"
      sha256 "3ccac0deb5c5211f88428899369158b7b98ad96d182e87846cb4ac3201692978"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.517/veryfront-macos-x64"
      sha256 "1d711f90e955eb1068e6322a8e0e4d7229f7504e85a8e16c74b9b292d264164e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.517/veryfront-linux-arm64"
      sha256 "e86c970edcac125d645409f1ea2c016d14519d16bfbfca4b3fd5f691406f9747"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.517/veryfront-linux-x64"
      sha256 "55019cec39e31c0b5698b6ea736e27912c5cf2105235f9e78c401935a29e2ed0"
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
