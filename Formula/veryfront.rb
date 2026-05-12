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
  version "0.1.494"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.494/veryfront-macos-arm64"
      sha256 "53dabe293017bde216250b3e440e1e5c2e3c1e81ee06442b0fac5c5e6d59f97f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.494/veryfront-macos-x64"
      sha256 "b4fafd9e54d4fa37050f5c4f8ebae393926aa2f55d4acd8f219b8509b94a1777"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.494/veryfront-linux-arm64"
      sha256 "37c48bc5b9b42fe95c2df1fe1d7f6b83f1f1d9edd083f56f12d4e345e19f70d7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.494/veryfront-linux-x64"
      sha256 "c240007590fcba870656cea41de550c3ecedfb5d29c1197e2e7923f46054d27c"
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
