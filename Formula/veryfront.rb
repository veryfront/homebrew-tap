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
  version "0.1.1214"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1214/veryfront-macos-arm64"
      sha256 "d7f1294ffcfb6da4559266618d43e9d346eb6712ff034b8d5fe7152c72c632ba"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1214/veryfront-macos-x64"
      sha256 "389a7abe99adc296349a2e0b5ebc67601c513bfdbcd5d79e9c8957f9bc8a6193"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1214/veryfront-linux-arm64"
      sha256 "4fee0a1fe322280ecaf6e581858dee1141b8df86c59e2d40b707d40308283cff"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1214/veryfront-linux-x64"
      sha256 "3e60da488097d702853564fb1a37cdc53d952c7ed7d5ad0f7bb6b3d3f590b57c"
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
