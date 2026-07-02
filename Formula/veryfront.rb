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
  version "0.1.991"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.991/veryfront-macos-arm64"
      sha256 "32eccd7a8a8f6170f6ae02d38476b162a9bcdaee70b33217d626f81abe59615a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.991/veryfront-macos-x64"
      sha256 "4575a8f4ac7f79459eaedbf3773b551613ca53d912079f2f9fe85eb1741527c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.991/veryfront-linux-arm64"
      sha256 "780d6579ad53d990192649dfe6f2e138604a7ebde0438fca3f0ec5065aa045c9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.991/veryfront-linux-x64"
      sha256 "4fcf16719ca84964eef68ba51e4eb143942c849020cddab7485898d5b0c7a290"
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
