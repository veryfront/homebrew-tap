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
  version "0.1.537"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.537/veryfront-macos-arm64"
      sha256 "2e43a9874d649bc120b55a6b9b49b35e2b55e00d7be309b1d803f8a64c1ba66a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.537/veryfront-macos-x64"
      sha256 "ea860851f5897d02e12eb5bed854e786b81031f48d91bc4d956f29191e565057"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.537/veryfront-linux-arm64"
      sha256 "4a099ab0c56153b846e32df387e9d2cac47f10ad6928bb06cfc71af7522ebdb2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.537/veryfront-linux-x64"
      sha256 "b7a8750551c6e9bf8b8b8c8ddb6ee4f83b961d07bb1e5f07aefab4bbb71f6100"
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
