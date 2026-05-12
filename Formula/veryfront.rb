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
  version "0.1.495"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.495/veryfront-macos-arm64"
      sha256 "3fbdbc5de65664b6d79edbd6306f477e545f91fd72ab2879e79fb1a677974edb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.495/veryfront-macos-x64"
      sha256 "da16cd799f5c00899174a5bd9d32b818e90ef106c0c2f69a83a9b8bce6650d08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.495/veryfront-linux-arm64"
      sha256 "19fb970f333b6acad8b236fddc8133e4d8cc4a31bc33dc5b40ac93cf43f12d46"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.495/veryfront-linux-x64"
      sha256 "ba337c44281b4f42a9d45fbb7d5e924ce05b0af50bfcb9c27ce34f2235fce339"
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
