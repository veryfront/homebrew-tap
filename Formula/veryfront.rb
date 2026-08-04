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
  version "0.1.1192"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1192/veryfront-macos-arm64"
      sha256 "df019347186340b5d2952ada81390ce0f3e931a0ce7597f327722d38aa517aa2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1192/veryfront-macos-x64"
      sha256 "7b44d5046d1c51f783f16f29d9fe317c31226821f32fd031b98be1f297876ab8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1192/veryfront-linux-arm64"
      sha256 "0dd76713bff3b02c55a8e468222b8c29b90d87dbef1c6a3b304e00afc793ae76"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1192/veryfront-linux-x64"
      sha256 "b4edc420d19ff31824420921ce890d28ffbe32dfb58f119e680b4c3de0199ef1"
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
