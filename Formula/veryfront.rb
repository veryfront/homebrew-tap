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
  version "0.1.388"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.388/veryfront-macos-arm64"
      sha256 "6e6b5a758b19e0718bacce30d7b28005309f6ef69e77abc53eb113c2cbcbfa31"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.388/veryfront-macos-x64"
      sha256 "2e629b0a56081229884c733b39fa5a240d2657abf39603314a9b5879fb92b9e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.388/veryfront-linux-arm64"
      sha256 "06cd4f0d9354b26a8a6f45cd2766440ed807f427923fcc5584c1025fcea08f27"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.388/veryfront-linux-x64"
      sha256 "038a3f3f767e60bb5589d9f070988a22060aeab6d73f3ea62d05f230fac162b0"
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
