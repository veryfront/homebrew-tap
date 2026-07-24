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
  version "0.1.1125"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1125/veryfront-macos-arm64"
      sha256 "3aebde9994737b87cc8f4e03ec40545e39111fcfba6001b8cb85efa1c5acd7dc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1125/veryfront-macos-x64"
      sha256 "1e899f4648f6bb1416fb1646cbc5b48d27e4b6c276765fde7a6ae058026dc0ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1125/veryfront-linux-arm64"
      sha256 "cabb4227277ca015519513fbdb0ba7dfda884f1341f16878e7b605a4826a1130"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1125/veryfront-linux-x64"
      sha256 "911f913d7475cc4611f434b70e33816bdb0ee89724ec839bf158c4df9adda448"
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
