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
  version "0.1.1083"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1083/veryfront-macos-arm64"
      sha256 "af12521cd588e03d4cd4adb34af15851a802acd36605d6181e7fbfb8c1d512fc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1083/veryfront-macos-x64"
      sha256 "86afe95c18fcc28ea63e49c03534c0be0591c9bef72ca75802962eb3bc33c86d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1083/veryfront-linux-arm64"
      sha256 "1ef013af01b13466a31d4038295d26fe0e52badc6ed20bd349e13892649923c5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1083/veryfront-linux-x64"
      sha256 "c75458d49976f87410ed170d0b2b78048dbea216ad4bdeabd7a282c5791f9b3e"
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
