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
  version "0.1.512"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.512/veryfront-macos-arm64"
      sha256 "4f53f29ad5fa23e83f147d632fb17c3d00f43d153fda7504bed1b010230e67ad"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.512/veryfront-macos-x64"
      sha256 "7eafefdc28af3e34bb4ca687d5c41e9661538db72bf4b2d66266eefbd12842bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.512/veryfront-linux-arm64"
      sha256 "319fae4856d59f9173e3a32cbd8cc40a954751749d8496bd10017b7b47d83959"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.512/veryfront-linux-x64"
      sha256 "978e6baa5549b19b412b861c7c7fc0fd3b20f14e9fe45f29abc239957197cb5b"
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
