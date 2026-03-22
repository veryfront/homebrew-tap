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
  version "0.1.92"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.92/veryfront-macos-arm64"
      sha256 "137a7baeacee813ff870839c353b35ec5dc2b49ac26479cafb41d6c899831c53"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.92/veryfront-macos-x64"
      sha256 "f65739170854a15cc167db1e09cae86553c6cdb30836556b8f4b6fb7174d6d55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.92/veryfront-linux-arm64"
      sha256 "43d2d2900dba4adaf14f7742905cf9b0be7d6b43ca334aa21e0a4714f74ff9f6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.92/veryfront-linux-x64"
      sha256 "64e0427c5f225037b3ebfd498612f059c1e24d16566b934f0221a2eeb8297ed2"
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
