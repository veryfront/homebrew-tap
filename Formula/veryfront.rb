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
  version "0.1.86"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.86/veryfront-macos-arm64"
      sha256 "889c7665b940270e96c6de16315c47ccf14222a44afa8f1ca266d12226266db7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.86/veryfront-macos-x64"
      sha256 "2595cd5d9392e71120fa06b303ad5f6c6ddebd017809a03fb21fd5f92c9ae9c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.86/veryfront-linux-arm64"
      sha256 "e9e81eea7ad3c567d4ef854b72ebc8b2b647d321b2cca217301380f205c874ab"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.86/veryfront-linux-x64"
      sha256 "ec597ec1949d400123da89c313daafca0bcd02bcaca0200a88de5c13ccdd4c80"
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
