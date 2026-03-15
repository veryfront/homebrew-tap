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
  version "0.1.68"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.68/veryfront-macos-arm64"
      sha256 "748abe28cbfcf0fd8ed611abede533f88558d0b7f83ebb101c6659cf216c343c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.68/veryfront-macos-x64"
      sha256 "62cc7e3091bde11baba8053e4cd1ee2e85a2ca0b956ca956343ba34d707bc262"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.68/veryfront-linux-arm64"
      sha256 "57527db0834ad25417fa012dd59ae84054e1efd48e2e2a276305eb9b8aff3b5c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.68/veryfront-linux-x64"
      sha256 "cd24a1235d35714ef6dbd2ccb2cc9df1e34a930c10094e902ecaf73fde80de9f"
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
