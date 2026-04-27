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
  version "0.1.286"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.286/veryfront-macos-arm64"
      sha256 "9f8d801959aeef37ad6b5c525b7965dd6655e17aa817297dc8d36079a5e23292"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.286/veryfront-macos-x64"
      sha256 "ac9f3981ef48fedb5ef3dd56d0d1d1ed604852f0f02707819e54997ef6a6b08c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.286/veryfront-linux-arm64"
      sha256 "ad121c97d92a6f8620051c8bba2d0381ac831e7e64e11689bf6cdbdc7a365401"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.286/veryfront-linux-x64"
      sha256 "c85070cec1aa6458cec4b92fd336091989bd841e55dc089334826e29855a521a"
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
