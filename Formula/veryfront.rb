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
  version "0.1.1135"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1135/veryfront-macos-arm64"
      sha256 "28be704ea253f9552213bb1cac14e9d425b2fc9c7fe15775ca3ab93ee8612148"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1135/veryfront-macos-x64"
      sha256 "99c34abd1cd9e05360d244d9e7fd966846785d1f893620ed88f1ce84b721ab88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1135/veryfront-linux-arm64"
      sha256 "c265df0ce863aec7f9f63a75c17e1db2514912fd96fad3af82dd59ded09798ed"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1135/veryfront-linux-x64"
      sha256 "917c1382df425449ee1464c461e81085378d703e916d8675dc02add559bd760f"
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
