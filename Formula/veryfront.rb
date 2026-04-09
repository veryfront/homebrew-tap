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
  version "0.1.149"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.149/veryfront-macos-arm64"
      sha256 "432bd4eb9566283256d1b40c7dce03fd6d6fef68c29da8aecaeed85b915d573f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.149/veryfront-macos-x64"
      sha256 "6c3d0c9659d8a3a1838cc1bea0eec9f02e9265e5b88feeea324e749bb5319bed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.149/veryfront-linux-arm64"
      sha256 "9a6644effec239c016245540454a78e34ce0ec4dfcb18a7bb6f7d3944fbac5e8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.149/veryfront-linux-x64"
      sha256 "dab64b6f20c69e846094ce65138c13e5fe666e1c0b3f6131f5af27f65ab25cbb"
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
