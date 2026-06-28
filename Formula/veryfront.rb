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
  version "0.1.969"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.969/veryfront-macos-arm64"
      sha256 "ddde8e35d92408e1becbfa55ad38e84b68781318338f8cc8eb5e7301a57e4f20"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.969/veryfront-macos-x64"
      sha256 "d0bda5e0b1384e13561bf37ffdfcf14bbd50f09b039dd7067a082e732ce6878d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.969/veryfront-linux-arm64"
      sha256 "dbe1ee93dc4e9466bfebb9cb5c12069798ad3a40ed1162e559a697da6f584997"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.969/veryfront-linux-x64"
      sha256 "9da7db423fddd881b801c8d9488948d916b26b4ca55eb9e27b85a47619623056"
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
