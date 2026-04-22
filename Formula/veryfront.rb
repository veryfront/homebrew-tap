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
  version "0.1.243"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.243/veryfront-macos-arm64"
      sha256 "eb24e2a8742eb50f0f1bc12755507e5ee1c4dc375a93fed513e3502d5e313a97"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.243/veryfront-macos-x64"
      sha256 "df1bc07d22e1496edec4f73fd7971dc464b6b784a5f43cd4fdb73a6e5661cf5b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.243/veryfront-linux-arm64"
      sha256 "9d2cf2e1fa21eb61bbaa1449c217008aaf7c6c259ca4b54bbe1d93bcb5199797"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.243/veryfront-linux-x64"
      sha256 "990d7cdf8e62c0370ad29be4f145592c91741ca359edd939ea69d9fd35517ba7"
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
