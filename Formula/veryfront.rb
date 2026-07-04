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
  version "0.1.1005"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1005/veryfront-macos-arm64"
      sha256 "9098b323e58b559a303023202b750248bdd10251d7b48fa584367137e0788cc4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1005/veryfront-macos-x64"
      sha256 "c543d91ca39544a4bd25ce2b2ca07598de6c50b4cffeea5bfa0623375502de83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1005/veryfront-linux-arm64"
      sha256 "7dae52a09e99eed69157cfa67555da00aadc355385a4cbcc6516f97677940315"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1005/veryfront-linux-x64"
      sha256 "eb797d2c08762341e4332f4a25eba5bb92b3f11d2fe24db438fd58f2fb3434b4"
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
