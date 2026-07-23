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
  version "0.1.1111"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1111/veryfront-macos-arm64"
      sha256 "1f948c8d2c04d26de90717f4f95b6300005132bbf51cb065a398f11952ac52ac"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1111/veryfront-macos-x64"
      sha256 "46f9da996ad66eef830cf1ce423f500f654b03bc6c356e7a4601f2794d2d0a06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1111/veryfront-linux-arm64"
      sha256 "198c1604479703992777e52b30bba0c6cb7c156bad98bda87042599b6c87395a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1111/veryfront-linux-x64"
      sha256 "342b59d2080f5dc36f7c3cba6e35ea8bd5c489197cf020fc5ec3a89d68660cfd"
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
