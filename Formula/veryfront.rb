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
  version "0.0.96"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.96/veryfront-macos-arm64"
      sha256 "25e4f32442266d7b625f2c2559244ab481961457d6422708e698bf641c776317"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.96/veryfront-macos-x64"
      sha256 "344933ba71f24f6a85df402d5bebc20ade18f121bdd6cff4a236929651a5080f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.96/veryfront-linux-arm64"
      sha256 "cfac61febd271a76c2abff10d8da2370fe496922dd0f005834365794ed8ea700"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.96/veryfront-linux-x64"
      sha256 "592a4c74e877f57f92c08983249a76b24336eb7aff75ab445f683e0de2d84cb8"
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
