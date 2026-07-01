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
  version "0.1.984"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.984/veryfront-macos-arm64"
      sha256 "d0d8a6aaa19490c08f4e09b7b0d301fa037f7bc923c73199186950c88086d64a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.984/veryfront-macos-x64"
      sha256 "2db7c430155dedd03983fdd72cc9aaf50153de048f0a63aadc0e0480876c745a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.984/veryfront-linux-arm64"
      sha256 "e7b38687e90934955cc8aad3d783394cad788514d5006e374185eb0e9dec58e7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.984/veryfront-linux-x64"
      sha256 "096d57f399126e806e9e961dd0f53b9b7228799c22a45e5dae54f1cc3abaf5d4"
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
