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
  version "0.1.1185"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1185/veryfront-macos-arm64"
      sha256 "1f986ded8f5faa6e3f410e351cb9c067f2850e004169b3c4f28fa23ecccf1ebe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1185/veryfront-macos-x64"
      sha256 "6bd17552c09c78b7a2b345f52d941a5b3aa7ce69bf08b9e4cbc9fffc1a2b8078"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1185/veryfront-linux-arm64"
      sha256 "799c7a5fde19e2e826822d5816f0cd516721bc317e48be92ecd4d22af685993c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1185/veryfront-linux-x64"
      sha256 "6cc1a1e3fc5325ca3d02f1351fa8f081f295bd5a6c17f0cf65d81535c49e3423"
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
