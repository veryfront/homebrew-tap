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
  version "0.1.643"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.643/veryfront-macos-arm64"
      sha256 "06a375e53544040a22f3151dccaee0e1dcccd6ad0d75dce973870385f097f564"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.643/veryfront-macos-x64"
      sha256 "f51a1e0d55d294198d2d4e3cdeb7d4cd11408d3cd10609a691c675c0fc827507"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.643/veryfront-linux-arm64"
      sha256 "0fde42f523e71c821653fe506f8e46bc2b30510d0ed258cd66ae0bf624b4e91d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.643/veryfront-linux-x64"
      sha256 "fa71c3a7ab7c183f3f51c0effb15922fb8cb32b2f55216085731d44dee8014be"
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
