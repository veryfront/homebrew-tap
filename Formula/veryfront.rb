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
  version "0.1.640"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.640/veryfront-macos-arm64"
      sha256 "cdd6a3e99100685366d02b646889ad9ea898df9ae10c658418601d4124ee0de5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.640/veryfront-macos-x64"
      sha256 "a36c2e98e00d34d8fc28848b211a3c569b76f33d02301bbda481509ef4490bce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.640/veryfront-linux-arm64"
      sha256 "33020144a412ff3af63fc7a1ec5b7e8be33636b425b811a9b9678e92d8f2b9a0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.640/veryfront-linux-x64"
      sha256 "35de9357933a24f929291366bf9232c42f8b6e51f27d2a1de0338b7d454eae59"
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
