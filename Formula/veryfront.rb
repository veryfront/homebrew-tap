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
  version "0.1.513"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.513/veryfront-macos-arm64"
      sha256 "697a2040684824daf67c1e1b55d72313b35a98d60326513862a576a6dbe6f81b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.513/veryfront-macos-x64"
      sha256 "014506f06c42b5c35ea04d1e635d7fcb0323eda50b1f24d4da702c6d52b4aa50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.513/veryfront-linux-arm64"
      sha256 "c5191e396d53b157ec8b99d46607774992ac9ca4c53c1960c19179c316eedcb2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.513/veryfront-linux-x64"
      sha256 "daced062158387e1a9a4494b38c5eb822de15e52baf99a1ffd98e3b6083df01a"
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
