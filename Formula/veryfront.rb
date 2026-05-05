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
  version "0.1.396"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.396/veryfront-macos-arm64"
      sha256 "53e15f8d524567a36953f1c9d0d6345200b6e5e80093e386bae31f8b7983cf01"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.396/veryfront-macos-x64"
      sha256 "1eababcf54ed65e74b398133ee426a82bfd5a3191d00ca47887f2ab8528ac8b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.396/veryfront-linux-arm64"
      sha256 "365fd1410d1a2bc829e10b465837b74811731366f4fadfb8cb1953c087c7f900"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.396/veryfront-linux-x64"
      sha256 "07e350a7a11a0487ead6bf9f970665290acb03cef560a6888374c3f76278beef"
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
