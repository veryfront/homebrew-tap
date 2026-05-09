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
  version "0.1.439"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.439/veryfront-macos-arm64"
      sha256 "eff17533bf9fd64594fa1378aab17138b9ce64fed9b5173426a23744d624487b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.439/veryfront-macos-x64"
      sha256 "f1b268814041977daa9c346a567c94bb379c35197ddbb938724bd3df0592c66f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.439/veryfront-linux-arm64"
      sha256 "918fc257b0378b3d2ca9a3d6efa11b8ac6be954e1a9d5ace525882c538ae3d08"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.439/veryfront-linux-x64"
      sha256 "10aa1395d04680755f46a10ca4fc2d1efd693f0c8d9fd648802f9198eb57b500"
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
