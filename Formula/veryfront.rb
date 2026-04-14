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
  version "0.1.200"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.200/veryfront-macos-arm64"
      sha256 "98eb64e41867994813f7151e4f136ffe292f9671ee17a29f68b87874608d430e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.200/veryfront-macos-x64"
      sha256 "416cd5db316ee0062535367ee12326ba9b9e16c18a20589e227c6efa41d0dd70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.200/veryfront-linux-arm64"
      sha256 "210b854ce27bb3c980a72fbac4afdf5d7892ff1002098c7e6e0c02bd59859fcf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.200/veryfront-linux-x64"
      sha256 "2b4e271e18dcf7f0b5c9814b03838faa9184dc1b792463a2211ff3d394837466"
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
