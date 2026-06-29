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
  version "0.1.977"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.977/veryfront-macos-arm64"
      sha256 "9c24d7c21d58ea32e8a948bac571c80ddb07431106482ab8cef0f618afb8d4d5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.977/veryfront-macos-x64"
      sha256 "150d5510bfd379d5784fa1ae0b5e35163cbc67e133bbee6fcd3a20e086b0f5a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.977/veryfront-linux-arm64"
      sha256 "d0f57520bac429b0db5f6f48e87ae095b7b1bad23bec7d8a9908457e5f66b237"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.977/veryfront-linux-x64"
      sha256 "3dde641d004fb674d98492ece4a74e49d6cb97f0fd551512f902db69f25992bf"
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
