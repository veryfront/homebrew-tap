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
  version "0.1.1217"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1217/veryfront-macos-arm64"
      sha256 "f1631419eede577c1fa5d4a681f636d3746b7d99227c0f4761f116181a9919db"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1217/veryfront-macos-x64"
      sha256 "b51137c099c38b17b8a32c7004e04c7bb5c1a67854f248911ad2281918758622"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1217/veryfront-linux-arm64"
      sha256 "ce182d7e628263b14db4ee8627ebc23261f80d4dbbf81937c02d636e6cec5ee3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1217/veryfront-linux-x64"
      sha256 "c411f6e5fad0aca8d3a7893b483c0abadbce49c18312d4dd44b947bea0fe2dfe"
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
