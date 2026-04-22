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
  version "0.1.256"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.256/veryfront-macos-arm64"
      sha256 "45610d7d960065e827e060220c5e652f2c774be7e7a080c6a3dbcdc92191429c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.256/veryfront-macos-x64"
      sha256 "5e435760880213f4872cef0175c6dfe7badd144f51d509432daedd0b415fa61c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.256/veryfront-linux-arm64"
      sha256 "512fb5628d84e556e657f954e90e4249be812f593ade0dfdb008bd384bd0ceb0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.256/veryfront-linux-x64"
      sha256 "7a280f70998b99cb30a81681981000b539868653db44650c6e7e62426b0d43ec"
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
