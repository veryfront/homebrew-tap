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
  version "0.1.1255"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1255/veryfront-macos-arm64"
      sha256 "570e3cd0e3ad92740fd0f42c5d26331668fd11563fd64d55cd0697cb61666792"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1255/veryfront-macos-x64"
      sha256 "9274edd0dbca1385fda55ddc51160e05a65324d541c12fea505ff9cbf27c9956"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1255/veryfront-linux-arm64"
      sha256 "8f690e8bb0e03e1f69253b3cd9c21a614cb8feb3ce465b66877181de390bc578"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1255/veryfront-linux-x64"
      sha256 "f0c8035448c0f3a33499b52f86f33ee792bdfcb2c019852ce2bebd03a62d9ec9"
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
