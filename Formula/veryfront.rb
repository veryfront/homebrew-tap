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
  version "0.1.120"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.120/veryfront-macos-arm64"
      sha256 "cb783506845dfeb2d73f1c34ae5e8a5e893036188ee246aa0a9254708ae665f3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.120/veryfront-macos-x64"
      sha256 "deba0de6cc2b0949f607418f63f1944aae6896bb0e1736ac2a8cc834f264cf58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.120/veryfront-linux-arm64"
      sha256 "c27601ab0b12032ad900e0c04a29122005df9225cba13806a06e148f1f174923"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.120/veryfront-linux-x64"
      sha256 "21d25b28c86f2430fa8b9f65fb5e5afbbac1f5480bd2c8d89c8ee8cdbbd92ce3"
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
