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
  version "0.1.1106"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1106/veryfront-macos-arm64"
      sha256 "a46095bb6885c414499cb526f6cb5846d5f90663691c419866c5015fbd85dd48"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1106/veryfront-macos-x64"
      sha256 "6e43ecae01518c2b36de60ec66f8c864dc704fb5b4a0043807ddc0416e842f6b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1106/veryfront-linux-arm64"
      sha256 "fe1ee06071a08ea7968e6031d8cbc6170ede9a6c0c5828b5431152392d80eef1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1106/veryfront-linux-x64"
      sha256 "3d5e091c301828cabc4a2457588315bcaeb1accb1c6b5cf265989a7c268e6384"
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
