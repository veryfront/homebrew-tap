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
  version "0.1.449"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.449/veryfront-macos-arm64"
      sha256 "9f623e1987d88c4420c64e6f97a878b7d41213e84aac50fba1ccf8d49b09845d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.449/veryfront-macos-x64"
      sha256 "6021658de27bfc923ff3226a3362329df81167ba156bcf0e611190d976ef4468"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.449/veryfront-linux-arm64"
      sha256 "1081d531addb71a205fdd7964f4738091de57dc927cdaeea960556bab3a3622b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.449/veryfront-linux-x64"
      sha256 "e33438f4775ee32388b152883fcabd53db98248846b564b30c1d6a6681688191"
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
