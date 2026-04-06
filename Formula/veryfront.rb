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
  version "0.1.137"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.137/veryfront-macos-arm64"
      sha256 "c53a6743d21da9d1edaf6e715df354c53e7788d8e650cb2761d390180613f371"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.137/veryfront-macos-x64"
      sha256 "46a65774682c2b37710d987fef984274b72410d3240c92c48cb6419ebe4d7fca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.137/veryfront-linux-arm64"
      sha256 "53a419b5980f48ecd6b5e7e7c6314935e1f2717f6018e7f2d56552a6d5a278a2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.137/veryfront-linux-x64"
      sha256 "7b739f4883e9fa4c46bc04e279b6b6e1635f1ccbc1490899e5f67d5e74796f01"
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
