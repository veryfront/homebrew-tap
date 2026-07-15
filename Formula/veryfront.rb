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
  version "0.1.1071"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1071/veryfront-macos-arm64"
      sha256 "1da8af64dd202639dd4fe11c5546848522cdb63c7c8a8b74a1496f1bc3e441ca"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1071/veryfront-macos-x64"
      sha256 "fed7cd6feff08dc7336d4d474afe226d40a6084ec2bced3bda270bc2ad997d91"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1071/veryfront-linux-arm64"
      sha256 "c2a7ce2fbd10731b757ed88e2687e0827f44c05909f384390302d9ebd97d8efe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1071/veryfront-linux-x64"
      sha256 "f2ce0df530928e51829ba940cf2e1373080efdf7434755f7b1e1ddf8fe9b3d67"
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
