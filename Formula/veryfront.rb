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
  version "0.1.473"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.473/veryfront-macos-arm64"
      sha256 "49810beade594cb7d388920f71b30a37026f810fcd6b2a14ae3fe9cdffefa7ec"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.473/veryfront-macos-x64"
      sha256 "549681f09a503569e50e68c35bf0d0034a108eea998c78062210b1a0d7b9dbac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.473/veryfront-linux-arm64"
      sha256 "700da784f8754c64bbcf478f64482f7be17eb38bf67beb03b2b57b1c009a7536"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.473/veryfront-linux-x64"
      sha256 "238cb25b2813b7db54774c5d03164bdffc65da38570ced466f17690a5458700d"
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
