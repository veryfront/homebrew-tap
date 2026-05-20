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
  version "0.1.564"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.564/veryfront-macos-arm64"
      sha256 "6c71355795a539e61c669281e3c6fb5850d559429171a8e664a720e2e6b7b65c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.564/veryfront-macos-x64"
      sha256 "feedc3e286655693ab81b01a70522afc668a5d73b7ccf7830959d2fff4869e09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.564/veryfront-linux-arm64"
      sha256 "214cab810d81b1f2c11e81edf69e0ff53109587a4230e1d3227c8515d2e9ee57"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.564/veryfront-linux-x64"
      sha256 "5ed3003b181630c99c1d66f2a8fd6f65f16817e66516ee01696447d2cd51043e"
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
