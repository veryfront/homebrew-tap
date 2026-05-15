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
  version "0.1.534"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.534/veryfront-macos-arm64"
      sha256 "932497de87ffd3562d1788dcbac5b2111aed9b4c83c096f22ca14729cb41b299"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.534/veryfront-macos-x64"
      sha256 "99ed8fa008164f3536ef6d9f43255c76c45903ae0d8621d8061b69693ca4f726"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.534/veryfront-linux-arm64"
      sha256 "160268d04a893cac60ed5578b5aa486e38ae72bb16180687d2fcc95e77700129"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.534/veryfront-linux-x64"
      sha256 "d04794e4e120637a2f850431d8c1e85d74759296b38abd4361116752e6168be0"
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
