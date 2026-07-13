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
  version "0.1.1057"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1057/veryfront-macos-arm64"
      sha256 "0a3013c61c43c9734c353dc7515e68f59fea25556a43e0f71abb9bce193b8722"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1057/veryfront-macos-x64"
      sha256 "eea7fe9b3c3f65c0d07fa88fbc1d3f6ec804100610e30b6c655e0416539a7f51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1057/veryfront-linux-arm64"
      sha256 "edca4d144fcf4e04eb8e5bac6c0bd1b1adb367d5ade81208bd44610e90e2630c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1057/veryfront-linux-x64"
      sha256 "ac4ab8baf4a9ce3bad26dceefc131f1be34c4307e1b9072f04dda1aafa811037"
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
