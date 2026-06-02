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
  version "0.1.635"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.635/veryfront-macos-arm64"
      sha256 "aacd6212b3fe2d01503f8c02fac8774d0798e945c573c1eca73c66b050951a24"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.635/veryfront-macos-x64"
      sha256 "0d10df83f7fd56036d4a7acaf5abee53b56075836c30e6f37d92d30a01a3581e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.635/veryfront-linux-arm64"
      sha256 "a7b0f3882563cd07cede2d8c950ca3d1f596e03d8dcc44860f8f7e8a7d9ccacb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.635/veryfront-linux-x64"
      sha256 "eab3ccb034f1c4ff1eeab197adcb5118a8c7ddcdd8b7d3512461263c16aaf36a"
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
