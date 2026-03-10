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
  version "0.1.54"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.54/veryfront-macos-arm64"
      sha256 "7ecd817fde27db5170a8fcb6285ad9f44bc563f91f3680caf310a3737c76e809"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.54/veryfront-macos-x64"
      sha256 "5ae0b7944e73ca457b104602387e55d9594114fd73e1a29c351b1de0ac326304"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.54/veryfront-linux-arm64"
      sha256 "ee4a77221bd0d28860eddedca95454790e190fa10909d31904a729ce8ad079b3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.54/veryfront-linux-x64"
      sha256 "6798bec779b60db6d9998e010a94e2de6772d33634e07b0adf2673e0c93c5c81"
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
