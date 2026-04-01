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
  version "0.1.118"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.118/veryfront-macos-arm64"
      sha256 "ffd214b5debb1ccc4a136b7e7bd5eb95baffac5515e54dc4616d93e7be824289"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.118/veryfront-macos-x64"
      sha256 "7d0ec30e41045425fb492f1b833e794fc673bc10c68cc6e9a708d0f5b3190edc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.118/veryfront-linux-arm64"
      sha256 "cbf33a83452b963d3f7a586a2ec461b6afaf3cd3a71c1ac1012ac96340190f22"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.118/veryfront-linux-x64"
      sha256 "3557d1645a478594d069f7a70b6ae98ae8f8dd320976d44a47f7fa24806c900f"
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
