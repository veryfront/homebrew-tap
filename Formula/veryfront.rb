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
  version "0.1.116"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.116/veryfront-macos-arm64"
      sha256 "2280a01cc69694efcaa75d0026ebde49f76a6dcce77a1a4e520bfe431a6a2edb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.116/veryfront-macos-x64"
      sha256 "0bbdc291fe905b8c90747188ace75d8ba16feb009a38141e750e187ef33f8882"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.116/veryfront-linux-arm64"
      sha256 "67101aeb5b38d66b15edeb6baafa60859cab5d0a4ebc89561b3bc43b4d0d667b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.116/veryfront-linux-x64"
      sha256 "b1b8b1995deb61f83159075509aa61ecff3903bbe991eacb11db98d103722980"
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
