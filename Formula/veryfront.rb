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
  version "0.1.320"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.320/veryfront-macos-arm64"
      sha256 "3a1d198b15314b8d543e6ea6183d662f5179d38e2c85c11694a762d0a305edf0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.320/veryfront-macos-x64"
      sha256 "86eec02f08798f436b414a2f9892b7afa055c1d264b6aa53d3e530f4977b3232"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.320/veryfront-linux-arm64"
      sha256 "c1be0dda31d25bfab71cd5fbba4cb92e023379dc0b6e0608b3cb838cba13ab07"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.320/veryfront-linux-x64"
      sha256 "561c880c8d7a6d2d22468fd0eca31f824b95e34681330e3c4aab30a517b60f70"
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
