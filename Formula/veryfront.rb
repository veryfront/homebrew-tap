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
  version "0.0.98"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.98/veryfront-macos-arm64"
      sha256 "b366e6d1441f491cdd66d89ae607a83c6947bf1258a8c8471c2a6e21e5ae1623"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.98/veryfront-macos-x64"
      sha256 "31baca2c09cdbef6e78af09969604708c3fe8192598e78a7ca02d17e94fb4878"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.98/veryfront-linux-arm64"
      sha256 "518b60f3b92e30bad53d5de0aefa54bcb3fda81e932ff6944f96c327a11e20fd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.98/veryfront-linux-x64"
      sha256 "0f52ec89d58a1526b7eff4bf3b760a6ec57af4b5b0ca1dd4f38d03b0f47626ec"
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
