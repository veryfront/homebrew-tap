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
  version "0.1.650"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.650/veryfront-macos-arm64"
      sha256 "946bd6241276def91f55408b21ac14e5cdfad258c9fffdd71b094f75d545a09e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.650/veryfront-macos-x64"
      sha256 "4d80cd85da887a15cb78b8b26048cc8986d32b4f51526e1f47f2e8439db7c62b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.650/veryfront-linux-arm64"
      sha256 "28dd5be23c9762b6930d2bfb34637f11086958a16a1bca5a6c2c293141be8ec6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.650/veryfront-linux-x64"
      sha256 "f87ca73d8dd9a503498311525bf733f048d1685c9f7604fd33a5119070232cd6"
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
