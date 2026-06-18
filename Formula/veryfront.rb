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
  version "0.1.850"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.850/veryfront-macos-arm64"
      sha256 "820b551c88764bedc57c8b2ede8b0016a251f63a1a37b601191ebccb1b00d60b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.850/veryfront-macos-x64"
      sha256 "bcd15d95a4142f26499f482ac0231d3e4addbf79f956dd36192e1d18f2311e43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.850/veryfront-linux-arm64"
      sha256 "19b9135df59a053ad90c12cd33c0c9b06bab58dc7ce0a447721a4f70f96def81"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.850/veryfront-linux-x64"
      sha256 "0fba0c614a175a8d83fde7204d8dfeaa05e33f36e20e7f1dea65e4e96a96722e"
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
