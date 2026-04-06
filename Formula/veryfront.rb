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
  version "0.1.140"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.140/veryfront-macos-arm64"
      sha256 "cfb42562dcca4e564232a39c47be169516f17e1a7a4b574554b0b2a31acb0cce"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.140/veryfront-macos-x64"
      sha256 "e187214abddaffc3f922a9a986149ad49e18159e0b3a2402fe636d782c852262"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.140/veryfront-linux-arm64"
      sha256 "368647a6e73485951f602974aaddc5eddd8da25c82ba8f381a78dc188a22f772"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.140/veryfront-linux-x64"
      sha256 "c8178228084529d1d7f45ab12da66530adec0553a605dd9dd13c0dec059a971a"
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
