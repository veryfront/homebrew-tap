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
  version "0.1.305"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.305/veryfront-macos-arm64"
      sha256 "bca9a8b8ef71f1e57f30d5dacb053e46932d86ecf0d03f1668029b52caa8804b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.305/veryfront-macos-x64"
      sha256 "3ac08fdb0ef3bbb581c2deab38bcb52ede90cfad4c7eb9fe33948eeba8420670"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.305/veryfront-linux-arm64"
      sha256 "3bd53b4bfa5c77206949bfc3a14d9790145a29e2039b0bb2dfaff1df3873fd6d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.305/veryfront-linux-x64"
      sha256 "89be6f9cff6f14db73ea53493009319dad23c21b8d496bcd521b13311f36bcfb"
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
