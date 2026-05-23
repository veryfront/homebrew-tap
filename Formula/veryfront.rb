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
  version "0.1.587"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.587/veryfront-macos-arm64"
      sha256 "6ae1b74dc95a449de846fe5fcdaefd329a84b9dd14af65da6b52ff4cd09456f2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.587/veryfront-macos-x64"
      sha256 "2e59555e4adbad7f4d3bd54b346ddac6d2a447f8123222110e874f45d6795c31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.587/veryfront-linux-arm64"
      sha256 "54867e24b550afdf9ecf3db1d8aae95b7ed6f850797e2415130c490b6d64aba4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.587/veryfront-linux-x64"
      sha256 "131ed9e58b8921c2bb41e7de00446b31d717a649557257f3b70885af946c420d"
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
