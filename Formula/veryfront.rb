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
  version "0.1.162"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.162/veryfront-macos-arm64"
      sha256 "8becf41c40610c601b00573e5918b2e8a51b6cd103916b22e3a43d61c94ea96d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.162/veryfront-macos-x64"
      sha256 "d78f7681da083e27212c4a0d42d8bf9e0dd1d20f278f13d8dff717e0ce873d5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.162/veryfront-linux-arm64"
      sha256 "5f1d75165182f1b55c85fb0c6f94f4f6b1deb9c98168c9cc96fcd6b52cf5984b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.162/veryfront-linux-x64"
      sha256 "cb386a05a76a3fa2182c6697fab77fe6d270e0607fee84ca5f2e65f2fe58d973"
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
