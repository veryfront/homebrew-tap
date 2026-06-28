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
  version "0.1.962"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.962/veryfront-macos-arm64"
      sha256 "e0608f37d40448ae58e2e63adfa8af4b6ccd474458ca312aab596430ce0476de"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.962/veryfront-macos-x64"
      sha256 "8fdcda994284181c4314e005d6a21896f62fb775b49011fdf7e0d56af547cc81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.962/veryfront-linux-arm64"
      sha256 "fcf6bc6cbc02c7b3960f57b7462385a176659eec2b6914dd7bfa923440e286df"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.962/veryfront-linux-x64"
      sha256 "3e8e2dfd74815e5ef639c2bfcae538465496ee2b0c3dd5eafd44a5f72b0324bd"
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
