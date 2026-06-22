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
  version "0.1.910"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.910/veryfront-macos-arm64"
      sha256 "6342fb5d52a6acf778371ab8c76d96fb09d3e124ca58d3c573b60ce28df0b1ab"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.910/veryfront-macos-x64"
      sha256 "0d15bb7bcf29706ddf629357e6577c7211f214e4dad393b251d6cd47ae232807"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.910/veryfront-linux-arm64"
      sha256 "a5b071630142e424999deb3d47bf728b2a5ffb55b61e4df4beed119d8759f79f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.910/veryfront-linux-x64"
      sha256 "c39800763c94ef18d63c5237d561156ac649ba0040b433ae70e7feaf92bbb3e4"
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
