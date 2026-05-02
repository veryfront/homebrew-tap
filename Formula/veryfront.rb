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
  version "0.1.358"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.358/veryfront-macos-arm64"
      sha256 "55de91286bf44e7d38d52d45efb54707444d6a6848a6ba2a21175d195bafc3cb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.358/veryfront-macos-x64"
      sha256 "7dad26061042a79a9c8a098e2b7415d5528cd47ef3dc1cc3d77f6ae58906c7a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.358/veryfront-linux-arm64"
      sha256 "137a5b8cefaf6417da6b9dc55dd22020c4b311d19bede060ede8b28e0b84c18c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.358/veryfront-linux-x64"
      sha256 "60d5006d400ac0d96ce2efd0dbbd08c915ce0d41a8665b50f13873b96f0192bc"
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
