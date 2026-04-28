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
  version "0.1.310"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.310/veryfront-macos-arm64"
      sha256 "230590a2d486d6f0b22969acbc6025763443da3fafeafb0a61716a2f3189ea73"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.310/veryfront-macos-x64"
      sha256 "40481f31a96f33d009aba8cc0d951df62a429bc90711ad01c3dc8e7e4250fa7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.310/veryfront-linux-arm64"
      sha256 "a78ed1645eb1da206896b887f13ab99f2ada984fad93e54380e0d8e3a5fa308a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.310/veryfront-linux-x64"
      sha256 "4c42be22a96c274d8e56f5b9ad4412b6cfbaa12976329ffbd42cf37920a631ea"
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
