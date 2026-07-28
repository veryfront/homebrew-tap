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
  version "0.1.1166"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1166/veryfront-macos-arm64"
      sha256 "12026d8b94e1b3079d9bc8ee07416204b301b3c869737f0362c918ecc1dc849b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1166/veryfront-macos-x64"
      sha256 "4a5fb6b71d949462a5284cce4092a363312d6e703805755ceb5ac2fe1c0abc28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1166/veryfront-linux-arm64"
      sha256 "23394c8730beb3c0fc393c2cf91aff37fe579b6e12e672d8fe4477891c2034d8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1166/veryfront-linux-x64"
      sha256 "857d8af38b775828cf98fa4101a7be3bcaedf0c5b514b3e25085b95b403a5954"
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
