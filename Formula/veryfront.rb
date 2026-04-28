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
  version "0.1.296"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.296/veryfront-macos-arm64"
      sha256 "5a5295eee8972452d45b27982ba838fbe115805691da5cc6128fe420e3130cc3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.296/veryfront-macos-x64"
      sha256 "4c5c6b17c881e34237dea605f8ff9c2d487a5cb4b022e3cdd250b299c54d8a23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.296/veryfront-linux-arm64"
      sha256 "3db92fd65229cc88b02ff42d9e8406df13ba19e147ef25558d14ae37115089b9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.296/veryfront-linux-x64"
      sha256 "3b1de091e08a522c8887f2d46d806edb19f5013dd8535228ee4b16954fbb55e5"
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
