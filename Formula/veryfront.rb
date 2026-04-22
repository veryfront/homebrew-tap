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
  version "0.1.252"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.252/veryfront-macos-arm64"
      sha256 "eda5fdc12740ef94fd5bd29d50e467a4936b942303fb936deb30b8cabf7fa87e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.252/veryfront-macos-x64"
      sha256 "fc3747dfa3123469995db64eee4ca734197b07a6f88dadb3a8faf526788eacc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.252/veryfront-linux-arm64"
      sha256 "32028f2978935f8b527ac517cbc7d7c880d3776fa5283acb5ceaeb44b93ec0a7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.252/veryfront-linux-x64"
      sha256 "aa89b70795ae0b19e88e427adba64f2e30cf45154cafb1804df7502fde712618"
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
