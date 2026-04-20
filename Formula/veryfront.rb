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
  version "0.1.219"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.219/veryfront-macos-arm64"
      sha256 "02e892ccd1facdb55cbdea333611493be473bead0947f45a8763a6f915159f8e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.219/veryfront-macos-x64"
      sha256 "b0d775aa303f54237232591d3151bb35e78ec47beef94840c685f35dda644de5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.219/veryfront-linux-arm64"
      sha256 "c65586952cf48e048a9310f31402422df738f67f3d6eb3b8b6bfff5b5f330ce1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.219/veryfront-linux-x64"
      sha256 "0c6fcf36431c8287b0a55735b0dcfd60c4923cc983864fad4da568938184619c"
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
