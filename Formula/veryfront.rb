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
  version "0.1.167"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.167/veryfront-macos-arm64"
      sha256 "c0ae2b439b21040345f02d887304a00ba7a3ee3cf654f8562bacc9cdf5e4a9d9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.167/veryfront-macos-x64"
      sha256 "6363905dd6c97e0e5ffed476b0b14246a9ce2c4829f34fb31db38d641b4ec633"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.167/veryfront-linux-arm64"
      sha256 "d3eba9111d628030b9c9dab01a155d77d120930c36480ba78657adbb6323afd9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.167/veryfront-linux-x64"
      sha256 "474263f7ff3ffd2688643b96b61bb824c3dcbace6adfb03434ae59f467541e8b"
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
