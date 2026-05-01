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
  version "0.1.349"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.349/veryfront-macos-arm64"
      sha256 "5164b9220c5f75461da047782fd0b9698db1c0ee07c6ef009fa966f9fa63a337"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.349/veryfront-macos-x64"
      sha256 "5491f5f983a9e6d2a9a875d0f584b46b680df02a5f939207be29ec804c7d9009"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.349/veryfront-linux-arm64"
      sha256 "130c2e60c1de489c17181806215183a7cfc3978ab19b5cd7995334956f787e71"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.349/veryfront-linux-x64"
      sha256 "c57e17d0e31287bd2b934ca4d949f383fe662fd78c81c77fc20622e36b95e2a2"
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
