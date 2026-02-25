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
  version "0.1.25"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.25/veryfront-macos-arm64"
      sha256 "93b2470906a25d28729ab8b68c5f6c3f84c54a0a0dfcb3dc3952c11a8234dbb3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.25/veryfront-macos-x64"
      sha256 "d44ca8029659439442c93961c843e8c4403f402ac3d76dcb64279207b4c4b29e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.25/veryfront-linux-arm64"
      sha256 "29e59b2c9b10fd12c75eabbf83e8fc4cec37202763fa57adea676784fbdb5b62"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.25/veryfront-linux-x64"
      sha256 "9fe9bd60915919c2a751c03a453ba4cafdfb6caa6a39ae64d22f6189cc8fef69"
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
