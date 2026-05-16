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
  version "0.1.540"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.540/veryfront-macos-arm64"
      sha256 "f76bda02005bff516039d8edd2e7121b14e60dbee50bc6d29f3325b483b2354f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.540/veryfront-macos-x64"
      sha256 "42e6bd54871fc11c8f7f3cd2ce6e960da6b04d36c24eca75116c58b48c4926db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.540/veryfront-linux-arm64"
      sha256 "72c2832df808693b66c90e53a468be3ca8db44d5caf75e403c27a78b967650c5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.540/veryfront-linux-x64"
      sha256 "5b8c09089a02f1b929d338c6fbaa7b6029de339e5605827ffb5c7f75fbd7d5c1"
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
