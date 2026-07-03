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
  version "0.1.999"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.999/veryfront-macos-arm64"
      sha256 "94306a97a721978117c7fbf9990338d1671e583f071170fe511f0c4786bb7a45"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.999/veryfront-macos-x64"
      sha256 "49720543ad120e9b43239896f2ddb68bc9c14af4a081cd86d8d32aecba9f4261"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.999/veryfront-linux-arm64"
      sha256 "53cf8de57e7952e638925d3a2ac69484d813cd0864fe9c9691422f525fa9b477"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.999/veryfront-linux-x64"
      sha256 "7dc601e596c8efea3fc2abaed87c6391a69ce83454d24548aa63bc0a09549c2f"
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
