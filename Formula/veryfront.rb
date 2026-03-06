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
  version "0.1.48"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.48/veryfront-macos-arm64"
      sha256 "a0c118cf62add0bfd470e72d726895e4fdb50b76aa568faa6b236d1159ece551"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.48/veryfront-macos-x64"
      sha256 "df21d629a5786e738feb2df7677b9701f488d0c3528b9dc4459eb8f37d43965e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.48/veryfront-linux-arm64"
      sha256 "d72f8d0e693545586b18469c083981256d70e48348a8882a0447249d896b5ccd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.48/veryfront-linux-x64"
      sha256 "312ae9ffb7f3c13fbbb0ce8852e70117461efeeb1c40ed2d3630d0732149289e"
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
