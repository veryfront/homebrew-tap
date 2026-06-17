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
  version "0.1.832"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.832/veryfront-macos-arm64"
      sha256 "912ebdf9c65a0aca0745aed028e21d1a63ed541afe51a676633d5c683c989e34"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.832/veryfront-macos-x64"
      sha256 "7204b403b0414a2444f40ebe6f6b275d0277b59fd383312c56013530a43d7560"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.832/veryfront-linux-arm64"
      sha256 "9787412d3a97fea1a94baaada05c7bc0cc3275535cb8e5cb0c2785b187afc5a3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.832/veryfront-linux-x64"
      sha256 "7bd5c8cfa5f8255089994de138de3290e1ff27f9f12a0287272e32ab8ead1111"
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
