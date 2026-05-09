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
  version "0.1.454"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.454/veryfront-macos-arm64"
      sha256 "0b4679564ed07ea3bee01234279a1b09f276f1fdf3a20575d17c30c1efce8061"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.454/veryfront-macos-x64"
      sha256 "d99063798789f7ab5256b0ffab5369c85658d99ec5c7d9e79f3208063da34643"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.454/veryfront-linux-arm64"
      sha256 "ce535f1b92adf58f867711f22a405b4e8552554117c2678e6114e645ace28b51"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.454/veryfront-linux-x64"
      sha256 "f8bebfedae4368f71105d35e778e7fae76929a47a8d841d42b52a641da681c8b"
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
