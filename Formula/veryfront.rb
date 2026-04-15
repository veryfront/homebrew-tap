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
  version "0.1.207"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.207/veryfront-macos-arm64"
      sha256 "7bea3680a07613eac97583f50485d921b6a015f68a7bb0af7e6425bf8d2cb9b6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.207/veryfront-macos-x64"
      sha256 "919521b783da5f794f2f26626360ed1565a6c32a273b1109da72b9f61ed2a649"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.207/veryfront-linux-arm64"
      sha256 "24e0a79be16f8b28f9cdaf0902fe9b8f204b8491c81ee10f45d4fdd0c9c2277b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.207/veryfront-linux-x64"
      sha256 "cb8db615946bad4e92788535c689368f03b31336dab0ede1f2b84cb616232b53"
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
