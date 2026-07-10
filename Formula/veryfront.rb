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
  version "0.1.1043"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1043/veryfront-macos-arm64"
      sha256 "012f4020ab7ac42cce8cff488dc5f84b3abe7959c52644c3a80c05f2da2404ee"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1043/veryfront-macos-x64"
      sha256 "e0eaf8a643cbf16640aa4bec70bd7e3c2f2c254a2554eee70c4b066b8a57d824"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1043/veryfront-linux-arm64"
      sha256 "eea2c3a5244280e00fd6844d3a7fa04671776f42fc4f2b992de85bb66825c3e0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1043/veryfront-linux-x64"
      sha256 "6cef303256faa254d4e7fe38c17a9c471f39830b9db9c59f8c14fe3799fb3c81"
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
