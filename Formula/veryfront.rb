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
  version "0.1.377"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.377/veryfront-macos-arm64"
      sha256 "afe2bda0d0132945415ab6c7b68600f24d2c9d84fbfbae7fa4c8eb57ec39a92b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.377/veryfront-macos-x64"
      sha256 "ec2435bdb7d168f10cb959e5ada3807f2bf4248c35e9b4e48c3552dfac839735"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.377/veryfront-linux-arm64"
      sha256 "220e61724240b870f649fcd9f54bafd7a71630f34aca86f62dd2aa181fa3e824"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.377/veryfront-linux-x64"
      sha256 "c8a71b47b03b903554208f7cb97b9899396ff7ed2e89bda044a2b1d2f36834ec"
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
