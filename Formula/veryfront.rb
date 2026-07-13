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
  version "0.1.1060"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1060/veryfront-macos-arm64"
      sha256 "eec6e1b08c295430bee2cb35b4a1d9b1c13491b1ec5358aa14b9106e89413fd1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1060/veryfront-macos-x64"
      sha256 "96b71f171b1eb642445931fb60377108d6da6702f35c9b6b037b67f81af276d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1060/veryfront-linux-arm64"
      sha256 "b5ba16b6b336243495666f3e9aa0c3f63dcd3351f6e5807a41604a1c43e30855"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1060/veryfront-linux-x64"
      sha256 "386487cc43c0420e79cd1def466bbdd09bf1ede14bec73cae919e311c56e4330"
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
