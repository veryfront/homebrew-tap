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
  version "0.1.451"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.451/veryfront-macos-arm64"
      sha256 "1e1287a238c490e6a4bde0483646ccfce4b048b273c4c5e613181eaa6239429d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.451/veryfront-macos-x64"
      sha256 "bae770b09cae4bbfcecc0ce7cf80035cae3e7b3da5ef067f9276f207403f3201"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.451/veryfront-linux-arm64"
      sha256 "bcf0441ceb8f4c57b28e2ede05438ed30f9cc0ba88a9a9d423beaa968dd191ab"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.451/veryfront-linux-x64"
      sha256 "b80ed70b7eac47d36b1bc9b71bcbcad1b69d1c627980f9f38dc9fdf88a680ed3"
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
