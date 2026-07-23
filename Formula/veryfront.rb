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
  version "0.1.1112"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1112/veryfront-macos-arm64"
      sha256 "b9c62c974e9242612e30a427196387d06a5345eb910d19d2276a28c4b9262e81"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1112/veryfront-macos-x64"
      sha256 "c54e74dc449c53124da947c39e50003c16d27e16296eedc124c6ca1bcb901981"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1112/veryfront-linux-arm64"
      sha256 "2ce350ab06ad33a08114351e7741414fa5bded5dcbbc71048c6e418cc56937d8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1112/veryfront-linux-x64"
      sha256 "e3a62d3d48dd0ed5daa8703165df0e77d236f33c83dcf4b44d59f9c92fb27025"
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
