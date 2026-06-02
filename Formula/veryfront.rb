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
  version "0.1.636"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.636/veryfront-macos-arm64"
      sha256 "7ef57bb5cc766bea1597c83e8031b4016ccca043e16a858316eeee4e78304245"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.636/veryfront-macos-x64"
      sha256 "1a38471ad33cf5d60da1431c5aed9c53c16ae19610f9cc06f6d48fca86f1fa17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.636/veryfront-linux-arm64"
      sha256 "5a88acf833aa12483a556e97173fc79726b66e74aed51fac4dcd11e984c1c472"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.636/veryfront-linux-x64"
      sha256 "4d8c74635bb2f80e6bffd8fd920b54e3825d429585de23c849d3ef206048cee3"
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
