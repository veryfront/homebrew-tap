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
  version "0.1.986"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.986/veryfront-macos-arm64"
      sha256 "a114e7cc46f480a2d7561fba4fc64e7ed5026b58d4afe93cc9b5c264b3608cd6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.986/veryfront-macos-x64"
      sha256 "c96083e5e47256c84a2fcc39f003d90afdf979e88b29b6dee654a4c23060a42d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.986/veryfront-linux-arm64"
      sha256 "dc46cc5c9c44d5477484bfe213658303b082162e880543841d3d61d326b155b2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.986/veryfront-linux-x64"
      sha256 "558f992713c4b7d444a1263b83cdb4beeaae9ebde8a22fd17f017ec1166a37a7"
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
