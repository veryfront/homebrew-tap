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
  version "0.1.1288"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1288/veryfront-macos-arm64"
      sha256 "96185eecc0b8cb6c06ec96a58dd136573fc74ea6f3549d54ddac95f8291a87a2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1288/veryfront-macos-x64"
      sha256 "52c7f968ea344507d85cf70c826d125419bf38f33976aaae33e727b0e1826b03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1288/veryfront-linux-arm64"
      sha256 "45a43bced33e9ce99750687acb30a9d814c42dcd4d79f09331a9b22b2f57ce24"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1288/veryfront-linux-x64"
      sha256 "67a2dfdc1579b9270084b36a06f3415b627574126b3d17f5d13b132197b03d8e"
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
