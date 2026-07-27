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
  version "0.1.1164"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1164/veryfront-macos-arm64"
      sha256 "b5fe63c669e57cb24a76f21e23b4ef2d0cff2da7796cb5fa376cb4e824bb8847"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1164/veryfront-macos-x64"
      sha256 "e978b6eb4d16a04be331da76b6f98bb3dcfeb725ed2969aadd6a88def5f00ed4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1164/veryfront-linux-arm64"
      sha256 "64bd4499e1f58cd8c06f9fdec89dfc8cf150f542a61380783eca1270aa990280"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1164/veryfront-linux-x64"
      sha256 "0eb844a07057f96ede37d3185c1580d268d8a551adef6132f948bad5da5b4c97"
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
