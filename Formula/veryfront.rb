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
  version "0.0.88"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.88/veryfront-macos-arm64"
      sha256 "303e29c3b99b54f7c7cd686dd0ff5a1e64cfd496b72905d14e8d8d542426524a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.88/veryfront-macos-x64"
      sha256 "ec462ecf83da72a44a7d4c7bf7052329ac85e4a21d96591bd40252512accab58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.88/veryfront-linux-arm64"
      sha256 "6e1500c6b300b0717d1984f948c8dfa4ce31fc1d1ea971d8d45cdad69e862ef3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.88/veryfront-linux-x64"
      sha256 "179fd2c1816626de5e2e2d2493799dddf65b8cd2c75fcc22c8fa321889260eec"
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
