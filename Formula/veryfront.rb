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
  version "0.1.879"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.879/veryfront-macos-arm64"
      sha256 "40dcf9736e4017a80fc0399a59afa17938856d23fa23c975b1528b83db333d4c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.879/veryfront-macos-x64"
      sha256 "cbf0b1b059d0d44465f8e2cf31f515d6e3e0460899cc524c02065329d1f2dfa9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.879/veryfront-linux-arm64"
      sha256 "4ca633ef3cf2418d42adc7f580dbed18bac2f41593077824c4cbec39a2815400"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.879/veryfront-linux-x64"
      sha256 "fb4dcbdf348aa156ee5ef2343f58e6778baa8ae538960674a57afa50fefe3525"
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
