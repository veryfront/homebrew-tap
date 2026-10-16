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
  version "0.1.1278"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1278/veryfront-macos-arm64"
      sha256 "73b460f174756ad9e4ddc8207b918b76e2e97f7cbb18590a6e09d5ffe05b775f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1278/veryfront-macos-x64"
      sha256 "441dadd4c0ab5a16934c392c9a2e323d179f9a1283f03d32cba2590b3278705a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1278/veryfront-linux-arm64"
      sha256 "b7881514b090ca8f6cbfe2c7ed6f2267089efaa9cbcaaddcd05316fcbc26e930"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1278/veryfront-linux-x64"
      sha256 "fddba4e3b59ca494b421ac4286175c58eb1c3a67861f6d2720f1c0563aa593ce"
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
