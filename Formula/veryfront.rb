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
  version "0.1.152"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.152/veryfront-macos-arm64"
      sha256 "b547433345790f4430c049bdc213155b820a0b1c433a1f517ff841b1fa93cd1c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.152/veryfront-macos-x64"
      sha256 "8927eebdb4f8390ec70cc6e854c98c7696ff2a4381c87a74313c44d3a0c2cca1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.152/veryfront-linux-arm64"
      sha256 "4db10defeb21aad6ade8fe6ecb12d875fcbf910bb1d59ec14bb43ba878347f0d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.152/veryfront-linux-x64"
      sha256 "1ffa69ceb63ef4e81c005910d2f751b3eab81c6732d22df5227fce649f7ffc94"
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
