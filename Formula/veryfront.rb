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
  version "0.1.817"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.817/veryfront-macos-arm64"
      sha256 "09cb2bcc2bb95c0a86f5bfaf2e6d50a562ad4f33b34718ad609b0a0d1df4bdc5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.817/veryfront-macos-x64"
      sha256 "cbe32b6f744e66615068899683f87e696ac48af0c8219bb5934b3c69a8a673cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.817/veryfront-linux-arm64"
      sha256 "bad6992191f12aadcf7d3f5da0f738aaa6c4340ec51bbadf26bed1cd36cf5bf2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.817/veryfront-linux-x64"
      sha256 "857b5696cc3baf737f8e9d86becd7c3ec7ebf37bb743a0f01ac36bc1c03743c1"
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
