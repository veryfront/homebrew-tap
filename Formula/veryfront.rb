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
  version "0.1.26"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.26/veryfront-macos-arm64"
      sha256 "da7168d1c355ea61a7acf1c620c4e59e7609da5cdd079e270b33fc4c1750a1eb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.26/veryfront-macos-x64"
      sha256 "196d3da0b51e8745ec8c1d4bd5757bc073dec6f5e77325ec5c7f50bb3d499ca5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.26/veryfront-linux-arm64"
      sha256 "c4aeb7ac1249d9f2a8c43c09985cf4b4dc8e99dbd47f74709f2790580a87d50a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.26/veryfront-linux-x64"
      sha256 "3a6103976e94d2d8de9d387812ec998b0bd9b9b1cc46b26baefcb5ce6853381c"
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
