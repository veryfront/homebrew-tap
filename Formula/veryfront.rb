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
  version "0.1.852"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.852/veryfront-macos-arm64"
      sha256 "b2c8be86a704926ba4ad0c7c97e7a75dfc90dbd4278dff7a46335ea53e38a8f9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.852/veryfront-macos-x64"
      sha256 "70e248257fa8018db9072be341538d4c04cd622d869d06aae4f18313d74d8af2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.852/veryfront-linux-arm64"
      sha256 "2b24d4038ca2c61a59fdbf39ad089c57f4f46c5edd122d665e988a472f13cd7e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.852/veryfront-linux-x64"
      sha256 "c8cd3333b19ba86d9a138371c04898d128a0fc0d294126aa665aa9cf7dbde686"
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
