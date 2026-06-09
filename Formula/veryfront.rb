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
  version "0.1.704"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.704/veryfront-macos-arm64"
      sha256 "edb63abd307d49e1a0155bcaa465b27bf17b748b97663d6b8a97e853918b01e8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.704/veryfront-macos-x64"
      sha256 "e2093f2eff9b5a39af922b302a12ac4d07b50e386c076bab5641bb06304dc1fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.704/veryfront-linux-arm64"
      sha256 "b907c0c076dc4bf7d7654f5082aeef4a583d39a3cee9a7bb98a16d2af5921353"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.704/veryfront-linux-x64"
      sha256 "39c2881e6a822ee20e87992f562656fb4780ac022f30d0510178feec7366fba2"
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
