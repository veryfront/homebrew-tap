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
  version "0.1.559"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.559/veryfront-macos-arm64"
      sha256 "ddace840eb93e6b8742e7b0fe22bd4ce7ca5876cab4454d6434e4ebbc052a075"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.559/veryfront-macos-x64"
      sha256 "c3e8960a808360c189e4ee12f5dccd40e73c0bf8ac0b146e87324124ff337e88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.559/veryfront-linux-arm64"
      sha256 "62c8bae51bd8c41461c4375141c63d40652df81702558ca5ecdedce57f33d324"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.559/veryfront-linux-x64"
      sha256 "d5a27a776c17e51a048a5326dd57166662bd77ff3a7b2dc4a8906adeb9da6b32"
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
