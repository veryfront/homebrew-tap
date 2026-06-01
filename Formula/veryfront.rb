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
  version "0.1.628"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.628/veryfront-macos-arm64"
      sha256 "fddefe0d309d1622bf4d6b79f0e41a65880c6ae9c6748acd49c4113006ab0c5d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.628/veryfront-macos-x64"
      sha256 "72224620bc5e868b2faf84f6efd2f6d6dba8d0ac558c6ce1a923a775c7d8b345"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.628/veryfront-linux-arm64"
      sha256 "80a76ef2b1d4a06b50f2cb1bf9ceaae8a2d95d841dd6fdfcc6b5ab2c492b4efc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.628/veryfront-linux-x64"
      sha256 "93d96cbf0afbf04dba06bd2e5e9520e854c3c1292256c3bf264cdda09a51ee76"
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
