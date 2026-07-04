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
  version "0.1.1006"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1006/veryfront-macos-arm64"
      sha256 "98932b1704b329d3fb7c873a1f466c04f8c5afc8c6fd2290f91738522c497da6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1006/veryfront-macos-x64"
      sha256 "c54d86823b52c96b6990bcbed8ce450e44efd0dcd9dbad537961e278c06769dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1006/veryfront-linux-arm64"
      sha256 "b04f44cd38da5eb1ce3b61a69ac20461ed489960b0b482846829702db2369e29"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1006/veryfront-linux-x64"
      sha256 "f91bc9364c6ace142897e20ecb9a9fe0e510de3b2e1d77fa3200851f09203c39"
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
