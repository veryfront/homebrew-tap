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
  version "0.1.562"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.562/veryfront-macos-arm64"
      sha256 "4feab2c2f5b426bf2efe8be43b753aae82e31d7defd2c8282f3e68b0ef42e134"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.562/veryfront-macos-x64"
      sha256 "230468e6ca0cbb39f18f5a589c514d5176b793d9a6301ef3a2de8f43221f40b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.562/veryfront-linux-arm64"
      sha256 "6662c0732a9122c877a2ad8864f464dce3eb71945b5e48b967c35d6e9995ebd0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.562/veryfront-linux-x64"
      sha256 "6a6fe761b33b75df7d4c4eaed48c03503ae3c605a6ef863546c97e64c3786e80"
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
