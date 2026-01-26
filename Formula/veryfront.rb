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
  version "0.0.80"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.80/veryfront-macos-arm64"
      sha256 "14e42e80b09daf02b4acc89405ef98d6c75834388fc20b92c72cb53f0f223600"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.80/veryfront-macos-x64"
      sha256 "48a454a737c2c7684c4d7a72a6817ceac644fc7b652e7630da9ba3b4461543ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.80/veryfront-linux-arm64"
      sha256 "cfed5c3796f9027b795717d8489bb76e991775399f409928c8f94faf7da3162d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.80/veryfront-linux-x64"
      sha256 "a71126dff132d0977aad3da7fa76bcece762143f191600e6c73b84d208e608fe"
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
