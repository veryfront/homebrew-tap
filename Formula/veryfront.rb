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
  version "0.1.80"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.80/veryfront-macos-arm64"
      sha256 "0d942d966e65d006fbf21a255fee3714e0933b186f0b63165fc3e0710405faa3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.80/veryfront-macos-x64"
      sha256 "d70b1bb11b4f72e95e44f037a201a385fe6d50f2958a2c271e59b9e742ab6d85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.80/veryfront-linux-arm64"
      sha256 "9e1c09f1c4e51aaa5876440eee124f62380aeac6ceaea211bbc92bc102794b44"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.80/veryfront-linux-x64"
      sha256 "e21c12aa6b4e223964e021d8f9c7a62c04e7606d38794c935464b96832f9f0a4"
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
