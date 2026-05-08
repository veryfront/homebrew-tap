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
  version "0.1.425"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.425/veryfront-macos-arm64"
      sha256 "fd8143cfaf278fe1e361d23e7967ceb7710fda0ca71111954f64de4322006065"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.425/veryfront-macos-x64"
      sha256 "bb4eefaf8ba99fb051ce3e06962f946386edbfe866f9c14738dbd1e6657c4008"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.425/veryfront-linux-arm64"
      sha256 "01580c4819155b4cd20ef5556348de384b8f1ab384fa460014895d6af19984ab"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.425/veryfront-linux-x64"
      sha256 "67d51f614073d449fef65c0b7e8a1c1cf25b5babce94417c77b003a93497db08"
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
