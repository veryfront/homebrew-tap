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
  version "0.1.926"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.926/veryfront-macos-arm64"
      sha256 "9c217f5004b50b3f3b5af43d0d775840f056891e54b4b719f9c6d2ef87a1a6c2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.926/veryfront-macos-x64"
      sha256 "602cdb3c5fa6622974c6c910c7d3655c7b7d5deebc837dad19a697f73f939e9a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.926/veryfront-linux-arm64"
      sha256 "c83273cff75ebfe931218a5636ffde1377f080972418e521f1746551d8400826"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.926/veryfront-linux-x64"
      sha256 "5b14cde250b38ed910c49dd1be09f809a0cf1516e4fdfe5c755d53800b690976"
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
