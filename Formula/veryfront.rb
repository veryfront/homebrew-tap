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
  version "0.1.1025"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1025/veryfront-macos-arm64"
      sha256 "00c8f6c88637731e6e7c89a555a786b3c9f69bfcfc98750a6a1570d61c137a27"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1025/veryfront-macos-x64"
      sha256 "707d03c70daeacf3fc8cf157c2f11cf338509791ddd6fbb0e6ca8a52eb6ac216"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1025/veryfront-linux-arm64"
      sha256 "8a12cc19bd31efee9deff582672da773329678e3087269f6c3b58339bbbe722a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1025/veryfront-linux-x64"
      sha256 "1b81c1dc396e5eb4f39c6cb02b80b67e9159928823d654fbec3eb9da0211211d"
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
