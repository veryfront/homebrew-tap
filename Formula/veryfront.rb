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
  version "0.1.1228"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1228/veryfront-macos-arm64"
      sha256 "cc94a2027d381c403395fae06d65c570f2ecf72fe21dcfd7c888460b5d51de38"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1228/veryfront-macos-x64"
      sha256 "353a2eb0fd861e4862c3b28d71fef1c78de0b867db80f517e41d1840fe655a92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1228/veryfront-linux-arm64"
      sha256 "26c630bc0be31ff7b0a26a4c290abdb21dc57c914f1155fcfca706db6c05c2ae"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1228/veryfront-linux-x64"
      sha256 "6bbf9aa9879c5070a0f4b1f1cdf3b48b814288739f464979c55eb51f2459f0cf"
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
