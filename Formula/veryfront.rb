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
  version "0.1.393"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.393/veryfront-macos-arm64"
      sha256 "4299b1242af0bac8a42b2dd2ab6596963d1ca7610a165e6e31aa7a47e960f14c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.393/veryfront-macos-x64"
      sha256 "75d02d9cce7c7b709fd275486c9cb64dd34fa931482be4ae48a97723032b4355"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.393/veryfront-linux-arm64"
      sha256 "0c79d0850b04f4647182a34f8e1a8181a7732630990ebc6e178b86502daea3cb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.393/veryfront-linux-x64"
      sha256 "f7e23332ab082df7b2682ff12f23dab3c31e0915db92eebbdbdb81a5e1fab187"
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
