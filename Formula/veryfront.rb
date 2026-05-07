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
  version "0.1.409"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.409/veryfront-macos-arm64"
      sha256 "f19ba3bb5d2f8f4e3a8543071bcab3836f40d00c5007e5179fec8f3fb035ec2b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.409/veryfront-macos-x64"
      sha256 "915645d6ab0286c995eb8ccbbbfaaab7753695e44cf43ea175c048c3bb03a072"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.409/veryfront-linux-arm64"
      sha256 "1825ffdd4203eaf4ac38da6dfc329381918ac4158852c973f840ebc609f94d53"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.409/veryfront-linux-x64"
      sha256 "4b68c51abc69b62075f32ddb1bcc19aa5f38bee9062e990ae5d0b446936213ff"
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
