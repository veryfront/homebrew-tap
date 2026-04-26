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
  version "0.1.276"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.276/veryfront-macos-arm64"
      sha256 "375f9cd7dd80b0cd4a5e64444e2d98946e97dec7f3b1fa7acd961369fa23cf2d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.276/veryfront-macos-x64"
      sha256 "47437f9c70280455e65fc4c341474a38263648fb9152061b13ce5baa96754ac9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.276/veryfront-linux-arm64"
      sha256 "c62f49e5f4e5746040b81201ebc5472a441b62456cfa92c91cf47f45da70ad14"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.276/veryfront-linux-x64"
      sha256 "39bef5e1c7e4fdf3f1bfe5c173efacdd169ff3a9aa1b02c127a8db76badaff64"
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
