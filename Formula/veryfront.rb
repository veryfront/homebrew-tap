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
  version "0.1.611"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.611/veryfront-macos-arm64"
      sha256 "66c5f4fb1d6df7fc78a48413c5c46676420c1c4fcf899ee0d32bb58e8d5dbc91"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.611/veryfront-macos-x64"
      sha256 "13869e13fb05afa1a33a85acb8c92b7858b0d87d25cbb85af1712eb7ef47cea3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.611/veryfront-linux-arm64"
      sha256 "1e57c87d28f078fda681f148ca3dd5306d75c9981be40b2e0bec71a681390be8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.611/veryfront-linux-x64"
      sha256 "9340d4ec67a1fe8e7f268aea96ad40b5b362e5569f720088429dcda6deaa16f6"
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
