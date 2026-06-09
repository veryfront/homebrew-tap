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
  version "0.1.742"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.742/veryfront-macos-arm64"
      sha256 "9fa4b5551f9f61db7e758e362dbbeb2d3a4cf81b11c3e68c1c91d4d1c744708c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.742/veryfront-macos-x64"
      sha256 "bb55930f0ee276a7df2a358319f8d097ded4bbd85cf1c2734693cdee9555dbe4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.742/veryfront-linux-arm64"
      sha256 "46af8197f8bd6b24e3adf5f0668ef5215d7bc393c4792bc8c8aa68986f55a3e1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.742/veryfront-linux-x64"
      sha256 "192dceb0548d64f41825cecd8e98a6709f62d9dfa74884b41546cc8a0ee92399"
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
