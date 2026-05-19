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
  version "0.1.560"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.560/veryfront-macos-arm64"
      sha256 "d130c895215622319dc3330461d8a9622cb7ce04bf8a339d130fbe2b3a8ac67d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.560/veryfront-macos-x64"
      sha256 "b31cd74ecae9d5f983b8704364695b1fc024a073cb6e0c74549bf884d0e7e7a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.560/veryfront-linux-arm64"
      sha256 "a500238e0aa7cce8f73bb614ffd8f0965c44586b0f30de5ce2876c8328edeae9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.560/veryfront-linux-x64"
      sha256 "42c2cff53feb7b66940a2fbd227542e67952f8fc336aa6251d7c31d07387ab7d"
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
