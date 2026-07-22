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
  version "0.1.1101"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1101/veryfront-macos-arm64"
      sha256 "5cf33f9cba6ce71378d47021ac8c9b6f931c7e148fbae26d578b2701e414b918"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1101/veryfront-macos-x64"
      sha256 "577e32412294799a03f2daeb9b1dd0268cbb9d9444ab7e7c824c45257fe4faba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1101/veryfront-linux-arm64"
      sha256 "318d00cf71649db07e9c0225a9774e38b1c5defb9eb605de68ecee3a1410ae27"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1101/veryfront-linux-x64"
      sha256 "102d284c6211a387d850a664e308976bfec4b801e4fa9095595448aca38d9791"
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
