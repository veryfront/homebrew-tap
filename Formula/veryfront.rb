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
  version "0.1.677"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.677/veryfront-macos-arm64"
      sha256 "638a409746e34490bcbd8097814131a4bfec34894ef2f390d18e3668d64d4ea7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.677/veryfront-macos-x64"
      sha256 "dcc0d681060e635694aca15f9c543455c2ff53089af69bff33224551957e2466"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.677/veryfront-linux-arm64"
      sha256 "c7298a3f164b1c03aaf2eec1b361c7d400b192cb2fd6f7e79d29fe8a3e029db4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.677/veryfront-linux-x64"
      sha256 "7e7aa1f558cdfb86120409c4a23ef59cffee06840e6d208cec900d92cc245f9d"
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
