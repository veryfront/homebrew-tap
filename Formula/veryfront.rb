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
  version "0.1.1078"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1078/veryfront-macos-arm64"
      sha256 "5b85da9eeb275fa8d7f489c0b8cc1b16b3d8ba917cc8540c15a8de7c6057fc1b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1078/veryfront-macos-x64"
      sha256 "7633fc823c14e6a47f4349c70f6af45ce752f4ca2e4faf8b19755d93981e1003"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1078/veryfront-linux-arm64"
      sha256 "42e5a9c14d7f7b8fc626004f0bdc4b54318aea0119cf520cfb285d3cfa60b799"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1078/veryfront-linux-x64"
      sha256 "4a176fd8183cda825f5df1ff31621f63c3f455dd9e5fa1e9dac95bd85927b075"
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
