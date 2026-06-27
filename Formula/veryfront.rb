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
  version "0.1.958"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.958/veryfront-macos-arm64"
      sha256 "5f49022d50cec6bb15d83eb7450605004571e950d7f92610e8028daebb01310d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.958/veryfront-macos-x64"
      sha256 "6fc87eaeeca3398fd4751181310e13fd4ba92ec371f8a70990f33723678b29be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.958/veryfront-linux-arm64"
      sha256 "c2b09af4a75bfca459c9957fbeb7eff23a3d70de45e4154b0e215d5f1078ad96"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.958/veryfront-linux-x64"
      sha256 "99de26f5546e1b765017df9d879f22349b2c579550bd967151c5d1f908cbf4ea"
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
