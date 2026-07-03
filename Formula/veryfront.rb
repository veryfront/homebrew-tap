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
  version "0.1.995"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.995/veryfront-macos-arm64"
      sha256 "4749ba9879f85ac770cc6b029b6b551137b661a92815907f518e2036b57c67fe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.995/veryfront-macos-x64"
      sha256 "cf5e59057777168322088d70808bcd89027dde1bfce5fca086c1ec7a9f0a0a70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.995/veryfront-linux-arm64"
      sha256 "9a87323a5a62a30fa4cecba9a10238ff9ec1e3aa71002e5527428a780f70603a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.995/veryfront-linux-x64"
      sha256 "6d10e58e596921bc1c7dc8c91341fb9cb19bda42e765340865c21bf3aef8b122"
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
