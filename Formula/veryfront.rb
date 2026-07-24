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
  version "0.1.1124"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1124/veryfront-macos-arm64"
      sha256 "e0d6b49c144215e5e5546a8d33eb57b6856fbfcb568447cea2818ebac64bcb09"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1124/veryfront-macos-x64"
      sha256 "66f136076d1100d18aadbc015b242fc3ffabd3b3bce0c96cd1d4a2f0ffc1b343"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1124/veryfront-linux-arm64"
      sha256 "be29cfcd99aeefdb3db62c3edaf7e9eab64ba1b6b036a65a332356545a699f50"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1124/veryfront-linux-x64"
      sha256 "1949eee3c3a9d5ba77814a3feef431f8844a1922f238aa20f2ab84ac4b587be8"
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
