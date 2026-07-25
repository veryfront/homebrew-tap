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
  version "0.1.1145"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1145/veryfront-macos-arm64"
      sha256 "d6637e6e9a868f1dc9df6a11c91facd1e5d950f570fa2ffd09915af12024bf86"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1145/veryfront-macos-x64"
      sha256 "158d989a67ffa9b9c7a527cacf377e6a72879b11f6130ebc760cc62c96535eed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1145/veryfront-linux-arm64"
      sha256 "7e941d64614e6ab9ef8878252a336b94056da8abc53558f7c476e121a25a50ec"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1145/veryfront-linux-x64"
      sha256 "55ad70a6ad2f782dbf1463eb84276bab15e6f56a8292046b4894cbd41643bca3"
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
