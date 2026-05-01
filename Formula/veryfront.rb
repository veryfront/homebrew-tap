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
  version "0.1.348"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.348/veryfront-macos-arm64"
      sha256 "3b83522d4a2e2d3335f92ee79fd22e79e03a0c3be8f6ee716fb3752f072598c7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.348/veryfront-macos-x64"
      sha256 "c97ef5dd183e85f1c51feaa7bff80f17c3f40eaf66919fa25a3bbb1266e7046c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.348/veryfront-linux-arm64"
      sha256 "40229690b1c1fd220db8e8b40af94a671381ae8e6f8d61ca944973b6eaf632ea"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.348/veryfront-linux-x64"
      sha256 "3726b504062eb99ee9c71709cd1a1a6fd53432f69f8642cd18508624a4291493"
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
