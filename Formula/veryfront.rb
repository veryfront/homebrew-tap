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
  version "0.1.146"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.146/veryfront-macos-arm64"
      sha256 "348d66ce721cc6d123632ca704a05b83c5445ccace7ac91f1883a2044e3749ba"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.146/veryfront-macos-x64"
      sha256 "2b395282b125c6ebd0cf407fb85b297e5fdbaea9d2102d546a64f1c83ae021e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.146/veryfront-linux-arm64"
      sha256 "bd24800062a42e0309cb1cf81fb62437737a250803562b67c267cb00137d63dd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.146/veryfront-linux-x64"
      sha256 "122d5c1a2910851aa513373f932210f06f9baae77e21e8f2cc26336d2c598f9f"
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
