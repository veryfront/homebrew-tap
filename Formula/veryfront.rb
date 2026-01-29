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
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.0/veryfront-macos-arm64"
      sha256 "f98d45c8d06462d252c2b2cac4bdfd2041b7bce96d5afb7d8027d802b9cb0db7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.0/veryfront-macos-x64"
      sha256 "da525479faf6c11bc3b9192574ca7e258b3c886d6c9c319ab83ec43867caa4fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.0/veryfront-linux-arm64"
      sha256 "3cee2441e5b7f1809acfdb12eb51374510c8a893d1d7aa6d73de773f7c876b82"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.0/veryfront-linux-x64"
      sha256 "7fa30781a716dac3ad308ef577750821505473dfb5108e56d6165f76e6f38569"
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
