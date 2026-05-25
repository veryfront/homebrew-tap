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
  version "0.1.593"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.593/veryfront-macos-arm64"
      sha256 "153ceb18f4b2c4268aa1d31af13309b1d9d3e29a63e89ba0b05846398d86cda0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.593/veryfront-macos-x64"
      sha256 "ef00f56c8c067ee0c7d547e031acd78c9aa898a0bc720cf0617ba35bf7714b6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.593/veryfront-linux-arm64"
      sha256 "eb8392bd2b05975cfd704b34cf11ba4b6ab5e5f32d45c53ffa209f0087779f0f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.593/veryfront-linux-x64"
      sha256 "e8f17444e414a6951d8d372174d65413cd8768336634f9c1edf2fa696b8d6954"
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
