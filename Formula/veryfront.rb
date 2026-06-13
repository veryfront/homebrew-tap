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
  version "0.1.776"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.776/veryfront-macos-arm64"
      sha256 "27b191132c880b902dc72ff685aa35fe10765672550ae531813a3a5b193db532"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.776/veryfront-macos-x64"
      sha256 "8996edf0af09be1cefd1a03e8f42c8b8b446b2eca2a7e54b9bfd2b95f0264329"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.776/veryfront-linux-arm64"
      sha256 "5ab5adea8541a19ea51c329994be6c5553c54c8cab26dbfee684e4a843fb2444"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.776/veryfront-linux-x64"
      sha256 "cfb4d690f0bfdd3dabbbb0da202d7451e0a06df4136377e6f6f3040f863a7e87"
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
