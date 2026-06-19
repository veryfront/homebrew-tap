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
  version "0.1.860"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.860/veryfront-macos-arm64"
      sha256 "6236c70386be46b8a553a860a839405c7b11e6dcfa02a956cdc7713492b5f494"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.860/veryfront-macos-x64"
      sha256 "874d5bd026bca32c3a0be60735c3e87a6927700a57b9ce01d744c3d00bb49365"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.860/veryfront-linux-arm64"
      sha256 "545a7902d7e7650faff77d60e1c05d9f3369a6942adcaed7762f4c1e5788048c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.860/veryfront-linux-x64"
      sha256 "168a14d52345390d6d67cdcc549edd8fb67cc7adc4c7abc70d4425688406aa9d"
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
