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
  version "0.1.1082"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1082/veryfront-macos-arm64"
      sha256 "1fb997fca1f27a28bf0b3a4d36fb4ef18022b64f1190fc61e6ea3bcd7bfe432c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1082/veryfront-macos-x64"
      sha256 "0898bf3589a5ebfd0192ddabbdcea5827fc750df89a52e62727063a39d285150"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1082/veryfront-linux-arm64"
      sha256 "6c44993d1885ef5be73798eecfd712daee0bb8879e5005b9ad04fc2919704da1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1082/veryfront-linux-x64"
      sha256 "29afc64894345f4f3a77c5222ba9240fbca3880224bda916331b2372b6206808"
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
