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
  version "0.1.1008"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1008/veryfront-macos-arm64"
      sha256 "87d3dbc301221765796ffc8dd7d6fb922c6b0e642c4c89cf072b276a44b79adb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1008/veryfront-macos-x64"
      sha256 "9fafc0df4a7987eeb2350d6459c236cf4b0d2d6ebc380f72fd7ed678ccd2d694"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1008/veryfront-linux-arm64"
      sha256 "d317d05a19d5282128df7b0b5ce34f8cde50f27a59a68720c0ab7ff53563eeeb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1008/veryfront-linux-x64"
      sha256 "55657658023564554aaba7136fdd21775eb64310e60f6cb3ba285e14e43caa70"
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
