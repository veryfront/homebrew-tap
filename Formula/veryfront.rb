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
  version "0.1.110"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.110/veryfront-macos-arm64"
      sha256 "8ce132c677c98fcaa8eca5cf03a62e01d980bf551fa0bd10f8f5ffde29ee7ef1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.110/veryfront-macos-x64"
      sha256 "95e6b4f85bd971e84afef4840b6b53be8dbf0d67a6fc536c88dc3caa45f080c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.110/veryfront-linux-arm64"
      sha256 "ab14540409ec846c42c36da084159443981ece7991aa7426756c2f74e31954e4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.110/veryfront-linux-x64"
      sha256 "f3f344c3d7e8128e2f201ef064736e702f49dfd9e9610b86cf47f302ff934cd7"
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
