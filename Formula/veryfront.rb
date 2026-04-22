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
  version "0.1.257"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.257/veryfront-macos-arm64"
      sha256 "e1b02cf513c89915842730d45e64367fd973e6eb032f2f92bfb98a18fd155085"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.257/veryfront-macos-x64"
      sha256 "b758cbbb5ae30b01c756c187af7ddc9fa21d9c6244fcd5fc3a076e41d28d334d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.257/veryfront-linux-arm64"
      sha256 "57625f5b29ee4a0f19cae1dd2c31436434d1abbcb5a9e632508567208b17aed2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.257/veryfront-linux-x64"
      sha256 "438362bf07a2893c7c7b94d86b4f390308073e0dc2f8e002e3417f7a7694c9ce"
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
