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
  version "0.1.436"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.436/veryfront-macos-arm64"
      sha256 "0bff03a739f9cbb0cbb30d59b3fbbd4bcbaecaf1f86d487f0fa26d06630fb2b4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.436/veryfront-macos-x64"
      sha256 "a204fd23ac8b2bb797739f0cbd978aab3202a7c9c5be540068494c621d03908e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.436/veryfront-linux-arm64"
      sha256 "473876cc10103d5de066edc4fdaf6c3dc615a792ba17abe2c6d2546b5c182dd3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.436/veryfront-linux-x64"
      sha256 "d57c52603beec2ab6cc21bfe5dad06901bd0833029f02baa135dbb917db345e2"
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
