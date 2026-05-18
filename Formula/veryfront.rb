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
  version "0.1.549"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.549/veryfront-macos-arm64"
      sha256 "e4957f417d19353e0d5889044e188c61b08e5aa1c36e110754858add56d8199d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.549/veryfront-macos-x64"
      sha256 "47e2da076212c10fee507a87a245180182c38867ccded23c020b7be52ece8c2b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.549/veryfront-linux-arm64"
      sha256 "65049e898e26ad2146e55dd2c8f45627e33343bd07980d3228cab6e05e7f1739"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.549/veryfront-linux-x64"
      sha256 "bbb0fe71cf5264799a345cfeb8e29c0163d166522e34c3476b9c1a4571805af0"
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
