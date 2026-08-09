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
  version "0.1.1223"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1223/veryfront-macos-arm64"
      sha256 "431bbd3d7a9aed5ba07dd2e59a482bbd7643bf1654e546f95f9e60cec7da9b04"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1223/veryfront-macos-x64"
      sha256 "70e05d2576a5577043bf1229b8ddb91553c40ae89f2198a260859c1d4a7792f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1223/veryfront-linux-arm64"
      sha256 "8cf55a046c1acf378caa8849391d322e3d78d484bcfe2930d577d1f864290e76"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1223/veryfront-linux-x64"
      sha256 "7ce28eca5eb4d0e5c6de77712a64c6a14e053aed528c4f8ca4e4a39a9ac881d6"
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
