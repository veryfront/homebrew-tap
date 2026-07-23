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
  version "0.1.1113"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1113/veryfront-macos-arm64"
      sha256 "86163fd5fc9718f91dc955be62a155a797fe14fa5155f0681e272d942a38aaa1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1113/veryfront-macos-x64"
      sha256 "b067b6c7324f89319079a0f3da8349fd6b86c7268a2f7b44cfb03a48f9a04321"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1113/veryfront-linux-arm64"
      sha256 "a80a285b077014632c210d51bb48a11f33e0fdeb86775523a2f4e3c56aa644dd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1113/veryfront-linux-x64"
      sha256 "173a46358026ad593a86b996d9795913e8f515b8c0f834cbf293c7ca258b69c5"
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
