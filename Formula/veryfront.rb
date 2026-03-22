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
  version "0.1.90"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.90/veryfront-macos-arm64"
      sha256 "31f63f9a9dbe1d67af5b0177fa07da1a5fbc6a9e071345005eb972ba4754deb7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.90/veryfront-macos-x64"
      sha256 "a9f5bd211eec7ca9f2f4a6a59cee17955f8c581ea2a3b37f740dfe905c1c5841"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.90/veryfront-linux-arm64"
      sha256 "5c59722f175adb28c7635cebde7fd04446e25f7753f06068482b9375cfbb34ee"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.90/veryfront-linux-x64"
      sha256 "56c043a923018e6c1f799924353b87b4e3dadb08b61b3d74873a3736ce25f9e5"
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
