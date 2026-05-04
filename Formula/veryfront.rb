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
  version "0.1.378"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.378/veryfront-macos-arm64"
      sha256 "4eea79ed927175f9fe6eade8542de6e09fc3f8892cbae8484b09a45151b97942"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.378/veryfront-macos-x64"
      sha256 "d238b8dfee27f207d1f86bdd9a716ae39d745ac5e07028302033ad0ce37c37cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.378/veryfront-linux-arm64"
      sha256 "23aaf50824b8a43f7f3c62b969fc9a1b132bc14ef05240b6e901f960247b0dd8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.378/veryfront-linux-x64"
      sha256 "67a09075c6770acc29fc32a51aedb079a77d7fd6afdd9ecd2911fea1609744e9"
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
