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
  version "0.1.277"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.277/veryfront-macos-arm64"
      sha256 "edd63b2ee1613b145e3b2b4d54fb0de683962119994b22be80e63676edcbfb91"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.277/veryfront-macos-x64"
      sha256 "ab5d3d362db82161f27522610f657ff863f0860157ae0819590e842110051f8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.277/veryfront-linux-arm64"
      sha256 "6e4158785164d872f1851cd125577d26b40a28c837ef2e9758b92d1e5aa1fec3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.277/veryfront-linux-x64"
      sha256 "c51843bc7bb6009a55c70ba34748b4cbf99b79975cb2ce02bf8a47832983f00d"
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
