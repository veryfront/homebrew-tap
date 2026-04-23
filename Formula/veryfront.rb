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
  version "0.1.266"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.266/veryfront-macos-arm64"
      sha256 "4a1f393f454579af56939d46e55d274215f260e68eaf0b338aa0967a8b7cbbc9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.266/veryfront-macos-x64"
      sha256 "4f85669ccf6b30810155e7976124fc62c21c5c8f4f13560e85fd23a8ecb1edf1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.266/veryfront-linux-arm64"
      sha256 "472b6f838e8cedc8a34b056e0626d166a6db4c002db593b33099481bd6570577"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.266/veryfront-linux-x64"
      sha256 "6d2d2d6e57c408bcfea306194cedff184fdb3d62b5f8e3dae00a649e423325a1"
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
