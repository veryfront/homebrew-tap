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
  version "0.1.756"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.756/veryfront-macos-arm64"
      sha256 "9b2cc6fbe95d7f8792c9a74d5eb8467f204794844711d173eeed6fa2bb285e1c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.756/veryfront-macos-x64"
      sha256 "ea02e58b140be7d6b9301880507442dd7cd14f2cf19c4478393c85957c2ab8fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.756/veryfront-linux-arm64"
      sha256 "9e09f24235fea49325b30a1cc2b66d1fd3f937d6082c5ffd27a72bce283fd74d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.756/veryfront-linux-x64"
      sha256 "ff4040831c8ff6d11782981a1441dabadad3de4a758d59475feca6331e1c9989"
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
