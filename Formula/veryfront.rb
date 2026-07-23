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
  version "0.1.1110"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1110/veryfront-macos-arm64"
      sha256 "d288cf82b75372b3765a81146e9b6d682f8849a6257485a302dd71ccd073697e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1110/veryfront-macos-x64"
      sha256 "462091f587e81e6cd67d24058e4de3a1ae8e6e8627ce31554c7c47db6f7b8b47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1110/veryfront-linux-arm64"
      sha256 "8dd94e427d9bc08324b7031af6883c21bf4cd6f2e2f2253a4cc102426a3064fc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1110/veryfront-linux-x64"
      sha256 "4d9c1fc299c318c2f129b7861b4c640e9645ee77f051e4581dc9ebe28600871f"
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
