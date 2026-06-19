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
  version "0.1.868"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.868/veryfront-macos-arm64"
      sha256 "9ce6af3acb973669ceecce7d73a4fa8915f89ac7bc2c3bd3c2639a1c3e0163fc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.868/veryfront-macos-x64"
      sha256 "906172328a4bd8dc1fa3d0c787513da4cbc305fa25098ca6b74c217ca1dd7d93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.868/veryfront-linux-arm64"
      sha256 "e9e2272ecd5a61834ff0affc3edbcb298c03a2050012f3a43b28f8b8d11f1276"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.868/veryfront-linux-x64"
      sha256 "a08e8f8d21de04450f648911c5e8622f164a83166c5d1f9c512b97d0b095f896"
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
