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
  version "0.1.902"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.902/veryfront-macos-arm64"
      sha256 "2e1a22955686c531ac90e7974ff8879c5fdafe2c211ff13e3714c325251a87a4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.902/veryfront-macos-x64"
      sha256 "73e43b08ba5dc2468c1acfaff9b313cf3b9c17c2e9103219e64d83d2a39c4459"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.902/veryfront-linux-arm64"
      sha256 "92a14e477c3fd62db4d9aaa9ad9747df7e4c63eeb28a1cb3a45c29015d1e0b67"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.902/veryfront-linux-x64"
      sha256 "bf058e4ac936c340ed8c503bd394bf4891ae50e9b437c648af3cea9749fb6065"
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
