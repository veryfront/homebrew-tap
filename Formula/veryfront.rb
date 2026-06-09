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
  version "0.1.713"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.713/veryfront-macos-arm64"
      sha256 "65543e0c79e37e691f3f43e710297ee2586ccbd616745c142733bf042d35d772"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.713/veryfront-macos-x64"
      sha256 "7f242ebb1c63899dd5ac7a9250315ce1a928e7e07afe683390f4d42b12ca0d67"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.713/veryfront-linux-arm64"
      sha256 "178349349421c0a12f8338c4565a12aa042bd1f113151c1bab77c312a7280243"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.713/veryfront-linux-x64"
      sha256 "8a2db41b25dd86f2de312a43727860c49ca549ded7460d97d2b21cc9a1eee08e"
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
