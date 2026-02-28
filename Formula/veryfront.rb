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
  version "0.1.34"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.34/veryfront-macos-arm64"
      sha256 "598188fec4853a88410684ef7e44b5a3d770071cb2faaa38c85ae071b719b185"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.34/veryfront-macos-x64"
      sha256 "8c41844205771496aab7f3a42d3f241347796a9d8715b740a6aa5daf70097219"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.34/veryfront-linux-arm64"
      sha256 "f70e5c071c4b6bb163a0c21e24957809a8a4e2a0d3b58fb59ebe8bc280ef60a9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.34/veryfront-linux-x64"
      sha256 "a5370e3afdef20454839efd8efc4e9fab49b75fa7e5c76c2a074262cd2d7c245"
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
