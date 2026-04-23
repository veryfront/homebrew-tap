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
  version "0.1.259"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.259/veryfront-macos-arm64"
      sha256 "588439e0374e17fd83bd2c2487b98b901dc9a5e62e49d2ce785e4e98b291297c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.259/veryfront-macos-x64"
      sha256 "8f133a7f5dd27664e2bb374b2807942e34ffb6f6a48b55ab0393fd44246af76e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.259/veryfront-linux-arm64"
      sha256 "dcb6cbf995e80d6bdc59d1ce35c295113b1995aaf0d8f169173e3722adf8d8c6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.259/veryfront-linux-x64"
      sha256 "8074370c48fc60da620dcbf28c76e3f52c1a1738d4ce403a55209aeafa5e7424"
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
