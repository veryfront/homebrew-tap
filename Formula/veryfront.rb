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
  version "0.1.220"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.220/veryfront-macos-arm64"
      sha256 "1512f95259512565efa9f5f45d9a202957b370fb02ef23259bf6e4339fe71544"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.220/veryfront-macos-x64"
      sha256 "1cc288fbdcc6bf645e40900c4e5d1b1aba83e5153fa1c882175c1ae2e9f97f0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.220/veryfront-linux-arm64"
      sha256 "1635895c20484f5b0ea8c55d8921e0e6023698290ae68a62991b57a1a1de5055"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.220/veryfront-linux-x64"
      sha256 "3b69c6862b2a3541dedae3b49246310bca00fb7af25a5ddebcdcda0070e5cff4"
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
