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
  version "0.1.179"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.179/veryfront-macos-arm64"
      sha256 "f709dc836bbe80833ad5f72b6b24ae9332174e1be14f65e6cba62838193854b1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.179/veryfront-macos-x64"
      sha256 "909dd2d2bbd232bec13f45c86de6a19fd59775c4c09c35583e4b936883a499b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.179/veryfront-linux-arm64"
      sha256 "c4272e495e68de9e70b5df4e54b58aef4ed2e76cdb962ae24f7e6b331bca2d84"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.179/veryfront-linux-x64"
      sha256 "006cb4caf58924fe71cf2a4dbea406e5b31bc90c72787765c6e881a8f531e456"
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
