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
  version "0.1.189"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.189/veryfront-macos-arm64"
      sha256 "56f2fa338e418b5a74a95fb5ea320d5d28183ed8d53e01335c71db2a254ea2b1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.189/veryfront-macos-x64"
      sha256 "d4ce1feef6915190724360dd3743c0332007820ca4e99ea90e6ca3b568c9faef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.189/veryfront-linux-arm64"
      sha256 "f4525beb358554e43158c02e6468450f15b0d125caeb90eb2e6eb739313794bc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.189/veryfront-linux-x64"
      sha256 "58cef628bac7b1cd27ca83cc032f2871c76994a7232c7b7722031d3ff460f13c"
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
