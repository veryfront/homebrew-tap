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
  version "0.1.542"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.542/veryfront-macos-arm64"
      sha256 "89d3ad35c2c4e70b8f8a41fc83f95b84a6ee5960fc9b6c009f297aad85a9310b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.542/veryfront-macos-x64"
      sha256 "16d12dacb1c498dd0e45227369b97e800dc131846ebec21fd67fc0531d640126"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.542/veryfront-linux-arm64"
      sha256 "3e9afb201a1ea368661b706d8ef3ee8be3545b21afbbd537ad3df2dadacc1035"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.542/veryfront-linux-x64"
      sha256 "f865528835f69fea11a4a17f6d3c0eb64349b313c2485b4e16c407c76dffeca4"
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
