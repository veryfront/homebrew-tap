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
  version "0.1.236"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.236/veryfront-macos-arm64"
      sha256 "80f59a3e67f18534e91631a03a61f1d993e00017ea435c692664f0f2abced617"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.236/veryfront-macos-x64"
      sha256 "13bc1e1ce530145a047b74acb8d2d89f65a340b26e5cbf05978377725cd9125b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.236/veryfront-linux-arm64"
      sha256 "598d57c818f2fb82ae3e6e0eedcc1cc7a8bf30bf7aeab2dbd474ce3a34386768"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.236/veryfront-linux-x64"
      sha256 "c88b7cb18681103b2245b63e4e4e821270c902d209079f477b81a25f1e503e99"
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
