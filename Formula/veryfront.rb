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
  version "0.1.906"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.906/veryfront-macos-arm64"
      sha256 "1be8c4c5171ee116038570987ac5d89e66c2e52c7cf73eec50b96904cbf5e220"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.906/veryfront-macos-x64"
      sha256 "c5bdaca4c9f84eae007de036877a9e115b9e7e7d96197bd1337dce9aa1376071"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.906/veryfront-linux-arm64"
      sha256 "f2db48d73a548fdc98564fc06d94aecf0b5268ab23e2fb4f77dd2ef56ff58ef5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.906/veryfront-linux-x64"
      sha256 "8b29ca727a80d0e0de52fdc8ab7fc74b5d3432c7f59e544bdcbc6e65fb7535e3"
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
