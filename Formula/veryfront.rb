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
  version "0.1.781"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.781/veryfront-macos-arm64"
      sha256 "36d57e2e9877b062f40a892db230e87e147d94311c783f74cf723b7b0016926c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.781/veryfront-macos-x64"
      sha256 "88298f5e1f89d39cc6f89e65d84c97e28559d28f26f7d79f72a083eb308f5a62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.781/veryfront-linux-arm64"
      sha256 "83f32ec8a0ed9d64a80bff4cbc1d87c32c20453f89877139682a165eeba708cf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.781/veryfront-linux-x64"
      sha256 "944e9f9f124ccb18665578bfc08e779bcdef4dea798b8508569508552947064b"
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
