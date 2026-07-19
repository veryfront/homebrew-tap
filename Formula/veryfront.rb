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
  version "0.1.1088"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1088/veryfront-macos-arm64"
      sha256 "5fc4bc5be26a18474abdba8e52e1b7c68f5440d9dbf99c0657b379e8963f3760"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1088/veryfront-macos-x64"
      sha256 "87b4de5b88f596bce7eb6449533591c1ac788df91f105ea05e301647c43b8b27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1088/veryfront-linux-arm64"
      sha256 "b889897c08572b822db08bc36a6494d556c3f2ef2d6cd3d3f3e7bb275decedd5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1088/veryfront-linux-x64"
      sha256 "17724fea3523cce9cb401d6133b750de0638e7a6a0dd4350c4155666ea7e17af"
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
