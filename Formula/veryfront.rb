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
  version "0.1.1041"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1041/veryfront-macos-arm64"
      sha256 "d43e286402d321960ad8ab066b9ccb59ced017e620976198bebcf3f16c3c83b3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1041/veryfront-macos-x64"
      sha256 "77cbb28d2d7818b46984bc353bab2e5e4d16572ac0861f3fc4d59b2e8857ba99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1041/veryfront-linux-arm64"
      sha256 "83e938655d9693f955333c22bad575b05f341e4fe0a5ff26dcd63f5c07ffd126"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1041/veryfront-linux-x64"
      sha256 "06b0fdb5949b8f874a467773fcfab600d7d65d8a365f2e04a65ad44b300ba22e"
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
