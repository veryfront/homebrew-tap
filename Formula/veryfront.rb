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
  version "0.1.380"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.380/veryfront-macos-arm64"
      sha256 "8ec563dde9ad309d7f49aa22b018b42c5e38f07d28bf6bb985aa078535b99c3f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.380/veryfront-macos-x64"
      sha256 "e6ce784a3dc8711c599ecab933f85a3fb4d53d37bcc991d4f686772e86fda636"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.380/veryfront-linux-arm64"
      sha256 "fd911b02fcc44e4cf8d11d727c2ac745a1a3a93697df4ec1f33a0f19a3a9f3f5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.380/veryfront-linux-x64"
      sha256 "c161ddf07fb5826ed4f0dfa25cbf984c2ebcd7049db440c6999962476203c07e"
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
