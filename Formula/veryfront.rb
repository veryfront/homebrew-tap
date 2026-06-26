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
  version "0.1.937"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.937/veryfront-macos-arm64"
      sha256 "36c8301ff04cc7ae06ae03bfd9e305854b950b4328d6909c220629e148524142"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.937/veryfront-macos-x64"
      sha256 "8bab93ff430828fe9eff638426a652620df02cb5624d6cad1a33e186139ee1c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.937/veryfront-linux-arm64"
      sha256 "38d84713327ce9902e015676fb02ac3852d2664424a39439215dbe6176a5e8f7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.937/veryfront-linux-x64"
      sha256 "041c2eac0b8ca92027d47c2cf00629378153a7688eb55407b4472afcdadb12c7"
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
