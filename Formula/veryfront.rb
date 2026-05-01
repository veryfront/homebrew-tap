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
  version "0.1.355"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.355/veryfront-macos-arm64"
      sha256 "35570ea3c735695d48b0e9bb2de8e85a434150795694fc646a4d4aa307cf6a8c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.355/veryfront-macos-x64"
      sha256 "1b32d8e1442618a82f0647bee9b2856eed2e986fbeb84ac456cc19ec19bbadf7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.355/veryfront-linux-arm64"
      sha256 "43026b6b897e03d2559b78467f7215e72cc3d33817efbd8cf7cd6caaffc0a7d9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.355/veryfront-linux-x64"
      sha256 "b8dfef80378049b1e481350638a14bf93fdecd0d16a21d5e9575e81030fe33a2"
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
