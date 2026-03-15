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
  version "0.1.67"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.67/veryfront-macos-arm64"
      sha256 "80ad57bfedcf1bfddc0fcd855002534645de642563532b65cabe95e0c7e97fca"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.67/veryfront-macos-x64"
      sha256 "64ceb2d2904bbba43fc3a9584d2d1f1efd150c42e26a36ee3c7a8e80f95629dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.67/veryfront-linux-arm64"
      sha256 "fa511bd77253039add941aae0dde6d41901710caee706f0bbf9fa001fa8aea9e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.67/veryfront-linux-x64"
      sha256 "82544fc90cbcceb0a95cf112028d1741ae5ebe816c2c5f3a939ad5a17e9cd895"
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
