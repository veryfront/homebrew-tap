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
  version "0.1.617"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.617/veryfront-macos-arm64"
      sha256 "596feb84322559655513c41843eff03e58a370d1c07e4f72d77e5f705838407a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.617/veryfront-macos-x64"
      sha256 "ceba73c683e4be2de1b4e4f1da0a65a0d40f4d60783e3c7c158a3a2e3c63a697"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.617/veryfront-linux-arm64"
      sha256 "7263823d50a221db5cf3bdf508171fa2dc68211a1e649e716d90c53b59fdba03"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.617/veryfront-linux-x64"
      sha256 "414024a0336bd3e8ae062d4a1d4ef48426ea081963118449562bc8cb1065a4c9"
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
