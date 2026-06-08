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
  version "0.1.685"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.685/veryfront-macos-arm64"
      sha256 "684b263296c11fd5295e640e879a85e5cd2755d6b0ff871238d141e0c61b2fc3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.685/veryfront-macos-x64"
      sha256 "8a3803c9806a9383cebbddc32ffb8372a0038e747dc619b8065da86d4cc14a72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.685/veryfront-linux-arm64"
      sha256 "fe6a73ec961f607eb1afe1fcf507ba37187b98a6ae5a22af46ec56dfa1868764"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.685/veryfront-linux-x64"
      sha256 "358bba2b3918cfa6c39e9b3300365976a5f022a987c365717f30a1d474c7540e"
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
