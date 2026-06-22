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
  version "0.1.896"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.896/veryfront-macos-arm64"
      sha256 "f1143fcd1a4b18bad9584b82e3c29b0d7c7e28675e03f780cbd8552413f99052"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.896/veryfront-macos-x64"
      sha256 "8b8eb51c3980e03374d49840636dd9ef35baa9bf4f797515ee4a671cd7d2b019"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.896/veryfront-linux-arm64"
      sha256 "9b4c262f466c67659352e381e15336f6155b8eee965efdda65febc088c59e7be"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.896/veryfront-linux-x64"
      sha256 "7880750d514a8c00185b7595d97de2f6cec758a5215a62f9f0e4c004067a23aa"
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
