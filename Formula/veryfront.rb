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
  version "0.1.807"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.807/veryfront-macos-arm64"
      sha256 "2a7903151dc63496c4ccccc67bbb367d6c196c05f0f2c616636fc88aa9758135"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.807/veryfront-macos-x64"
      sha256 "9dc6be195eb1b001bacb08a20e54f63ed922821cbb7d19cb87bf5f5464d86b47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.807/veryfront-linux-arm64"
      sha256 "fc415359310b1fe8a5ca0c80e0c8345458738860339eb4616704faf3144b65c3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.807/veryfront-linux-x64"
      sha256 "bec087f871f066312e85d3d12e728b7735c7dc67a4d37907c09b0dbc6a48fdb9"
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
