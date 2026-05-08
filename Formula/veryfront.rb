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
  version "0.1.433"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.433/veryfront-macos-arm64"
      sha256 "1c8d6ffb6cff9244d52056e496a6a3695fcae56c8a3f32274c27bc6889cb96f4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.433/veryfront-macos-x64"
      sha256 "95b999c6d1efa49a05ededa4628878aa32bff2d650bbc8ec4bbc80cd2ae91bfe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.433/veryfront-linux-arm64"
      sha256 "b19379f2f6f7ccfda35856b9f68d88728187612963e5775a886e900f8a9b67bd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.433/veryfront-linux-x64"
      sha256 "5a5cbf139b254e577d892642fbbce52d8fedbc21dbf5960a170ff7cc4f3e2e6c"
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
