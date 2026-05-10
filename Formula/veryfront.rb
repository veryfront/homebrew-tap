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
  version "0.1.466"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.466/veryfront-macos-arm64"
      sha256 "2ce262b4e87b7922646096508161560fdedc9d920d3f949896ea104c8317f563"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.466/veryfront-macos-x64"
      sha256 "cd0e1dbf5a1b528e517407da7520d089daa1eb600df727a13b92e952fdacea29"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.466/veryfront-linux-arm64"
      sha256 "3f0392c7e19e93dd972c57654d5a50d554d08f11aa7c63843958b1808f89c636"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.466/veryfront-linux-x64"
      sha256 "bec2c4634b2d793e9cb482d723ae76821c2826299f6633dfb3a5aa8fad9b670d"
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
