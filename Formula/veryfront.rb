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
  version "0.1.631"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.631/veryfront-macos-arm64"
      sha256 "5e60951534679ea4f846845a8ad9548c3fb0606c4c1ab8b6b1ed9d82bf8d377f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.631/veryfront-macos-x64"
      sha256 "1642b521168f9b9bb6a6f411446e77df22590f044de61368673a050351923954"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.631/veryfront-linux-arm64"
      sha256 "1eb54d1960b7f8c822cbde188068cde345fa539a1d963d47aff42e6f142945dd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.631/veryfront-linux-x64"
      sha256 "9cd05b5fbd79e1cd2b75c09064264b78b374a9a1b73a103e9425b27a2c2269e3"
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
