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
  version "0.1.302"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.302/veryfront-macos-arm64"
      sha256 "644c972bbd97d42b0317c0f9d768a9de5da3e96c6b0f56c927474af620619d01"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.302/veryfront-macos-x64"
      sha256 "2bdad904d221a03ff56b0f8b238c77d8d3a594c5a74c4f937c6e6ed7deacf97d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.302/veryfront-linux-arm64"
      sha256 "0593382a5103684cfebaad20c96365cdfcdd9cc71ba75168432a47dcb3f78973"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.302/veryfront-linux-x64"
      sha256 "de1a8429eb8e8da04f3f6dc790656f31f1ba74135ba4977aeb133c17e8d112e9"
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
