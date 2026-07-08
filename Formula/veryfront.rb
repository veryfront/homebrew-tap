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
  version "0.1.1032"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1032/veryfront-macos-arm64"
      sha256 "020e365827232b1ad47b95e3f34a30e7642db10965b9f05c4c31158d7856cd6a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1032/veryfront-macos-x64"
      sha256 "d205632b5a77d012bf1990350bae632685e7a3a8f221473485f5aae428a6c38e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1032/veryfront-linux-arm64"
      sha256 "3260ed82e0cf8150091935eb8a44692787f1b8ff6a6fffce36c5ef814a383dc8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1032/veryfront-linux-x64"
      sha256 "28c33803f9b6ad8bf3db24abd0d0778995f11980003211174444658165c86f6d"
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
