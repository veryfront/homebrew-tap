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
  version "0.1.1015"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1015/veryfront-macos-arm64"
      sha256 "c478c2c8ef9ef6a9b13dfc1bd00f4b4af589f60b3f45f77c7839019516e4c472"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1015/veryfront-macos-x64"
      sha256 "547b79b5c7f06bb224c91807b8eac9281c9557784cae3a24243dbaaecab279df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1015/veryfront-linux-arm64"
      sha256 "bbf96e74e831e5182e901d835e79b205672b3f448b73185f2e195bedaddb2225"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1015/veryfront-linux-x64"
      sha256 "78073034bf38dd2e5c6844a9431948e5e1457a0b69a3f53c027f99814f4f151d"
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
