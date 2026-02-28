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
  version "0.1.39"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.39/veryfront-macos-arm64"
      sha256 "faa67e383e432fe9a812f64859a4ff553fb041a6bded7e8d05e9aa30a6b23904"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.39/veryfront-macos-x64"
      sha256 "89223bdb5094a254f4b404b117b949274ab60bd2ae4fd499cd42617920076fc6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.39/veryfront-linux-arm64"
      sha256 "ea9de2090d4431e189d372041cd0159122f8661fc8a01afe1d93a44def467878"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.39/veryfront-linux-x64"
      sha256 "344d225c2cb4650e0f28bec788a68f4c48ded3cc30dc0a2a9bc36594b6ffbe00"
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
