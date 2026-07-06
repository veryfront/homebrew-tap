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
  version "0.1.1020"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1020/veryfront-macos-arm64"
      sha256 "96bef8fc09a4ba7855d9e72645e3e456bbab885b02c1a00163ef400093e35b08"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1020/veryfront-macos-x64"
      sha256 "a9141ddf5cc28cb7456201de023f652bf6b63e10200006e734db0b6decd2ec0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1020/veryfront-linux-arm64"
      sha256 "76b78040e68060a2dbda4a421ce327651ff8f79c5276ae87b5fd022459b2473b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1020/veryfront-linux-x64"
      sha256 "560f333df151860c080a20c13dd9f74157e79de3929bf70176ec4a0dc5438ad9"
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
