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
  version "0.1.915"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.915/veryfront-macos-arm64"
      sha256 "b2dc8ed9d77456965d1cf1908e9f3f2c79d39e28d89a8067cce3eb9a11882a1d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.915/veryfront-macos-x64"
      sha256 "6f71cb6c99762569cc5a0d072504a28804de70e529a11a0fca15d524323af5ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.915/veryfront-linux-arm64"
      sha256 "7ec7cf94e15580dfa184e8dffa7fd639d5377edf6be6a8bc143cafa06cf54a47"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.915/veryfront-linux-x64"
      sha256 "1b09380425a015398a3fce02942634f8882aca5238378d695f8f7204b977b447"
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
