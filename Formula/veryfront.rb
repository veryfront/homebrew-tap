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
  version "0.1.344"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.344/veryfront-macos-arm64"
      sha256 "46709bbe44b76f25a97826e6c770e50975b934a0237bed2c525ee05663e4058f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.344/veryfront-macos-x64"
      sha256 "ad5ceec586c22fdc7ddef6f81080b779e19f6345c35879968d3cc68b39a33847"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.344/veryfront-linux-arm64"
      sha256 "62eaab621898cbfb8c7496c5ca215a4a43cab69d2688512e48a182b8be73ff82"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.344/veryfront-linux-x64"
      sha256 "73ec5de703e83c6e6554c2c4323962c2b37848a0427fe94ec98a0bc912f119a1"
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
