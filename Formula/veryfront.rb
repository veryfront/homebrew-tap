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
  version "0.1.128"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.128/veryfront-macos-arm64"
      sha256 "c3fc3e2f022e330c5e1bf14c14347beb27858ee1d4b29e92678ffbc4af0c30f1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.128/veryfront-macos-x64"
      sha256 "fc69e7574e22f9f333c97877db7e09644cef78ddc35fa316009506e5c2a48e84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.128/veryfront-linux-arm64"
      sha256 "7f5f467e49b5fa21a4c1c7835c89b70ec515003508ada5bff10b926f8d06dc6d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.128/veryfront-linux-x64"
      sha256 "97b1faaf04baaa0db2f3489215676d2fa81b2aa44f4fe0399bb530a08c0bd5c7"
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
