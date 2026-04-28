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
  version "0.1.294"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.294/veryfront-macos-arm64"
      sha256 "60c0f6d541c35538d19ea40ece9827a8c1eb8cd540c379379130c3da4e6d77f9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.294/veryfront-macos-x64"
      sha256 "5a2e273ef2eb0edf7e186be66b7da31480d53292a4026a5f21f17773224eb194"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.294/veryfront-linux-arm64"
      sha256 "baa3dc40df7ea6c6cf50bee08b6a2a9ce2a4ab308822ab5d8b286895945170ae"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.294/veryfront-linux-x64"
      sha256 "d783e780b597352d0b9d89fb80d38e82d70e1d53efbd648282ba01ac97c7ca33"
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
