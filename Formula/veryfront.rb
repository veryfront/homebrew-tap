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
  version "0.1.1028"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1028/veryfront-macos-arm64"
      sha256 "23ad98c875d793d17b6ab48618a216c56c55adc2f3582b16656720cb7763cb7f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1028/veryfront-macos-x64"
      sha256 "facc9c3671603dcfc2438423072a0805bed1722ec4b1425f4d312d0d143b135a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1028/veryfront-linux-arm64"
      sha256 "1e9cff1c7ceaa3239a7b3739a86719dfc0f9b6d663813511974e55fed6995a56"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1028/veryfront-linux-x64"
      sha256 "19a23378a9e04c13fe630af33aeb555e934c19685c821a94a70a16efefd4b343"
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
