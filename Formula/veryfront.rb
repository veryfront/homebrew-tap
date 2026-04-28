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
  version "0.1.309"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.309/veryfront-macos-arm64"
      sha256 "ee69832fd7f85e0f5cd0cf066120099731c3d1368e6514952e1e1a0b4beb7dbf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.309/veryfront-macos-x64"
      sha256 "6fc5db6bf289c0fa623eb627c36efe97ae7c5633c0e8db67c3304a68cc808fae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.309/veryfront-linux-arm64"
      sha256 "324cf3dacaed86f3ac8bd44cc7902fc994bb09f7b520a21c92ec0de7bb57b158"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.309/veryfront-linux-x64"
      sha256 "b92ae62f381e5fbf6090fbe77be84e483e0eab07c68f4e4734bf0682fbc419b8"
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
