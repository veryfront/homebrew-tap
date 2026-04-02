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
  version "0.1.131"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.131/veryfront-macos-arm64"
      sha256 "98ff08fce56e6a77a3851c14a92d2754a6abc4b7496e6ff2a1ee19ea85797b18"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.131/veryfront-macos-x64"
      sha256 "bddf4e318255dbd5b2b3a153b4e406ecbf3216d0795610bf13fb7f48902083fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.131/veryfront-linux-arm64"
      sha256 "0649ab61db96078480926bc9744a13fdf95ee4cf1fc5e84a70cc57c17e6b051c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.131/veryfront-linux-x64"
      sha256 "baa9389fedd915188039eff26b67b523648e0927334738a3a67928c7d3b118a4"
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
