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
  version "0.1.147"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.147/veryfront-macos-arm64"
      sha256 "4cc784f33933a14523e155ebd59c82a8bdd2c0c93d5dc58ff7ec76377f627e9a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.147/veryfront-macos-x64"
      sha256 "36effee09c1d9e0f6edfbc9c14ac1a5ac2a886bef15d1975f0887ba09c1dcdc6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.147/veryfront-linux-arm64"
      sha256 "f5abfc75710e5251d6204deb0f84d962417ff0a86734ea1ece5d60ca5e87b821"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.147/veryfront-linux-x64"
      sha256 "0cb17a87fa89a572654a7c9f0d78121d95af664df07aa781958ecea145cfc5ee"
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
