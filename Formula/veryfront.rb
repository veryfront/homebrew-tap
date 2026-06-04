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
  version "0.1.656"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.656/veryfront-macos-arm64"
      sha256 "7d7c54c658be1a59f261d11c8ea96c3968c6dd581c11d66cd35c806925b84d58"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.656/veryfront-macos-x64"
      sha256 "987dc9ea4d0e7bbba27edd16e4e884a3abc931ed69440b856f1c03c819d244bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.656/veryfront-linux-arm64"
      sha256 "740209368ebc6e49e378b2bdf92b9895b5fb6c65a73195fb483dc45a28b181b3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.656/veryfront-linux-x64"
      sha256 "c3aa7bae11be1c5bf4a8155398a0516f25c409b4c3165c2198a1cece06f5c9c2"
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
