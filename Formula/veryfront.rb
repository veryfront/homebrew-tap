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
  version "0.1.819"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.819/veryfront-macos-arm64"
      sha256 "878af2d942140418f2b1076d970c7616067ec6910631a1d6ce0a0469a6318b74"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.819/veryfront-macos-x64"
      sha256 "6af998d7b4ff39e6a1d7f40815929e98248c6ee6a63a2ef3c33ceb8778c1108c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.819/veryfront-linux-arm64"
      sha256 "5ab6b057e286151072982c7c17ef7430cbbe1bb454243f60bd879d7d825d2a7c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.819/veryfront-linux-x64"
      sha256 "4281aa5f30207a683f24eb1d566b72373fcbe262c5f64923e9d3c33ddd720142"
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
