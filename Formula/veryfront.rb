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
  version "0.1.412"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.412/veryfront-macos-arm64"
      sha256 "81ffb198bc8e135f9c90f4501c03cffdefb8202bf3d87459debf74abef27e8d4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.412/veryfront-macos-x64"
      sha256 "d8fa6b2397d1e0bd14013773672114cbbc37808cc645757816f66cd7723caeaf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.412/veryfront-linux-arm64"
      sha256 "fcaef9c883277229394b9f1a334c308cf0db581b9d95ce42ecf15217dc75c57b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.412/veryfront-linux-x64"
      sha256 "39cf9186dafa2ab183062ef43e4162cc54c2fd83a655018f767faac6cfd812e4"
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
