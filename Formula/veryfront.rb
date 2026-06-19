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
  version "0.1.869"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.869/veryfront-macos-arm64"
      sha256 "b79cde0ad867924af604dbafaf9d56410f84eaa491eba3b9d4bf58083fdaa5f8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.869/veryfront-macos-x64"
      sha256 "8b5a48942197db388e39ff12e54504759002f4ca22a641c39922ebbf87f15d79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.869/veryfront-linux-arm64"
      sha256 "5486d4de175c0695a8972c3011ba5726066d7f1d2b1d570f40b76b312f6b1143"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.869/veryfront-linux-x64"
      sha256 "8c95dfbce0ad48ea201a9ca93113b37c852938b7ecac1ae36884c906f92dbaa1"
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
