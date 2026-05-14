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
  version "0.1.524"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.524/veryfront-macos-arm64"
      sha256 "67fc9da0cd9465b2a23b8ebe5c521d40341f6b61abd1891a7247d7201581c380"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.524/veryfront-macos-x64"
      sha256 "6d2b83fe963a59b309a3f28977c92e28c7e7325dd5159e7556c1b47d7a47a0a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.524/veryfront-linux-arm64"
      sha256 "e82c5e9ca2c242f6573b08ddd0d759faf2aea98d45e8eea2753a5a5e778e4c9f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.524/veryfront-linux-x64"
      sha256 "9ac2baf2374350954e2dd7ddea75b29cc47418e86b78e00d84475f59f962487c"
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
