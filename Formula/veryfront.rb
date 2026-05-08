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
  version "0.1.416"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.416/veryfront-macos-arm64"
      sha256 "beba0e28627e4aebdbb2421752fbe2e284bdea0193344f56a390eef778b01516"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.416/veryfront-macos-x64"
      sha256 "500e62df4c05737a4d2f98f87391852405a5a61f998ab2c3d31d98113747a5a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.416/veryfront-linux-arm64"
      sha256 "8c5e864637c30a174ca67758eab5f7333a38dd448274bbe3161eecd29a464467"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.416/veryfront-linux-x64"
      sha256 "cee5a83c4ef755afb8864b6e53e451e954f28e4ccb799df737346f7527b02b06"
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
