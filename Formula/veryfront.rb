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
  version "0.1.1251"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1251/veryfront-macos-arm64"
      sha256 "9a5780fc2ec1db39121c39dde997598559b495ff12de9b4c55c8d483437a92ed"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1251/veryfront-macos-x64"
      sha256 "927d884a2dcea204c91aef3fb73e58c0e043f6b5d77b7d84366afb2433571895"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1251/veryfront-linux-arm64"
      sha256 "445491272ebb77c7522636da6b388e1c8594a69de5576c656101dc18caceb922"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1251/veryfront-linux-x64"
      sha256 "a502a2330240bab0240e652c231095173c9d86329adfef1c9b21c5c30ac8c248"
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
