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
  version "0.1.346"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.346/veryfront-macos-arm64"
      sha256 "2e440986840dae6cc34dcc0778bea178e5190a341d7f11a6eb1ca8271c7cc4be"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.346/veryfront-macos-x64"
      sha256 "288e02278d4c80fb7c99170206deb9c786e79eaac044238800b747e0b5034166"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.346/veryfront-linux-arm64"
      sha256 "f890a038ed0062c4288f709c46b2e3995d0358e464786f80cf0bd89028e29828"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.346/veryfront-linux-x64"
      sha256 "398f6767bfed5931943ed8d8f85836e21cecb7b0b2ac22ab9b7432fe6b5b1b52"
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
