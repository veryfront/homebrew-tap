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
  version "0.1.571"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.571/veryfront-macos-arm64"
      sha256 "47f43a932a567b4ab21929b30e7b0e0d15b41277ae1df44fb4d4e9980d5b4a6d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.571/veryfront-macos-x64"
      sha256 "5aaa62d63a1efff7d0d6060bc47127c033835a5b94f772f4436b83610621fa92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.571/veryfront-linux-arm64"
      sha256 "b29dd54898f807d1beaf76e05417100302c5e71200730863ee2e4af1681223e6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.571/veryfront-linux-x64"
      sha256 "d4339dbfd40b9842af66a4d3bd1e31dfc2d4fd173710b08af6964c3ff80d84f6"
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
