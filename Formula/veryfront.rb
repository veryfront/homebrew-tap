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
  version "0.1.701"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.701/veryfront-macos-arm64"
      sha256 "25fd2226031100ab1dbdbb60e749cf868d3823099b9d95257cec994a65bf62ef"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.701/veryfront-macos-x64"
      sha256 "a6ac777509c0d424941a801a3b873c686d724b9929c0195f80efc6ca2f30371c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.701/veryfront-linux-arm64"
      sha256 "75df28f6b6786df58f9ceb5393dc7dc2b2dd049ded4cffd10f6a2d7c12fc8ede"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.701/veryfront-linux-x64"
      sha256 "8cfa8132eec57ec724794ea6dbe0dbad3269ad58fe6b1bd91e620cedd79ce8eb"
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
