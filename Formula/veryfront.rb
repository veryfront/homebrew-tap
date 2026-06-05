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
  version "0.1.673"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.673/veryfront-macos-arm64"
      sha256 "7425fd611b85db24ef51bb04409f1d1d7fcc24fdda1156bac8316cfd8f5ee6b4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.673/veryfront-macos-x64"
      sha256 "0e3b791537160b7a4b7008fe8b8a6537296ef117dba3b33373e17f5a4567f46e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.673/veryfront-linux-arm64"
      sha256 "1e56f4ac523a1c5108f0b8afbca50c52a671f0173fd3f3f12bf51823db523f0a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.673/veryfront-linux-x64"
      sha256 "863264dbfbca63ca4b234253796ac504885c74927253b42f7bd5c1844e582799"
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
