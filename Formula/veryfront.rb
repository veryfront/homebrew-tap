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
  version "0.1.427"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.427/veryfront-macos-arm64"
      sha256 "6a4bfa8931ac702344f313da09dea8ae854448fde4c9d268547abfc51a770f91"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.427/veryfront-macos-x64"
      sha256 "d567972277a5e17feb69e9af445c43d6a0f796a46837956f5cc41ea599d54cba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.427/veryfront-linux-arm64"
      sha256 "fd5ecccabe04927c86aea5b055e143989fd8a3462715a30d10604a3eba5696a2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.427/veryfront-linux-x64"
      sha256 "f05bebdb7c85f6613040e8a819fe18d5fe225c3607251579ead7c4febb01d587"
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
