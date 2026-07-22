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
  version "0.1.1100"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1100/veryfront-macos-arm64"
      sha256 "a2340a507caaaffbd3e7bc2fbecff311f000f3d242ce17e48c61805a81c46eb6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1100/veryfront-macos-x64"
      sha256 "52043e4e0f5b56802d67dad0893cb2f0bd86b86938f01dd29ffcb7c335f136a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1100/veryfront-linux-arm64"
      sha256 "13ec3516028bc2646da5430610acec9f3908b14d2c49113ae46bae0aa352b652"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1100/veryfront-linux-x64"
      sha256 "2e9a5df84b37503fe87d068fa3652b756efb31ff4c9e951fa12ea7b9c8e9f46e"
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
