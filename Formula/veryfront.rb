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
  version "0.1.339"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.339/veryfront-macos-arm64"
      sha256 "88e8bcc5c6568c6f16e1efd7aaf9f12edf95f9bc0155197fd40777090bacf5c7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.339/veryfront-macos-x64"
      sha256 "9af8cbe733a3e1c21f226942a08a513b3961e31335345626b5f4b76776cd8cac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.339/veryfront-linux-arm64"
      sha256 "01c1813a85515d0d756e728d7f1338b2053263b3d271057d87c80f69ab2705bc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.339/veryfront-linux-x64"
      sha256 "7dc4c01d00e2e3ba5117da20b313f555013cdd4dd2644e27f4ef90e6754c8ee6"
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
