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
  version "0.1.930"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.930/veryfront-macos-arm64"
      sha256 "fbaf6c5cda8e0361955cefadb3aff133d5d0404eb5801e616fb9feee1ed61872"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.930/veryfront-macos-x64"
      sha256 "91efd8b52986f90adcfc901d033f2e42d6d53e3af607c20a3b484709f0ea7b61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.930/veryfront-linux-arm64"
      sha256 "a209c6231cdefe3c7faa681b7a3613811fd0c53293328719a7f64662ea671b9a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.930/veryfront-linux-x64"
      sha256 "f6085a3aa32fbcce0b8853be0be5336c6defb53ac8092c61462dde6a00f258de"
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
