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
  version "0.1.492"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.492/veryfront-macos-arm64"
      sha256 "1853511c4c8e982fe761a3bb1655af085a6527d5dc5b09f96191bda679bf3e3c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.492/veryfront-macos-x64"
      sha256 "b0e05bbfc607c6d509c9201c0ce5261f76596d920761f08b95d1e43e34c03635"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.492/veryfront-linux-arm64"
      sha256 "604a9b2d43cccc668b89f7c13a04fdb0cd52056e420d752164b2138bd937dbf5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.492/veryfront-linux-x64"
      sha256 "229ad6e36a5bdbd7f1bd3163ed8a3815248d69225cdc9d98dbafeba9813274c3"
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
