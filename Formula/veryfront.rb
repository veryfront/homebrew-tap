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
  version "0.1.443"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.443/veryfront-macos-arm64"
      sha256 "3c544a95fea03b59bae5bb0f50d446d0096f8151b02815caaef23849682f5263"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.443/veryfront-macos-x64"
      sha256 "255ccf24063a927cfaa67a1161bb8de1a4bba5eaa6690c72d72d11fa4506d616"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.443/veryfront-linux-arm64"
      sha256 "f6311cdc8db04c942dd33e2a64590421f08253db82c851745d1a44c9d13b871c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.443/veryfront-linux-x64"
      sha256 "c3587d3ff2304640e5161f4cdabd3051dc215a15981250b62b634c092c3e82a6"
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
