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
  version "0.1.190"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.190/veryfront-macos-arm64"
      sha256 "0226cd5645ab2bf7dfc17508bd6f474da5a009aa97e20900bbdf3b219abf2bfe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.190/veryfront-macos-x64"
      sha256 "c4db59ebde53cf815fb0ed38e1291947740379b03a3061bd020b40a2a6bcf5e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.190/veryfront-linux-arm64"
      sha256 "b91a42c6df496e1e27b4f9bc6dd07dadf1731c293a33ce427ce9fbba99a54a5b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.190/veryfront-linux-x64"
      sha256 "7f8a007fed6b02f2b7da589150a92bb87be25b22376477c3a74cfebdd38dbc29"
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
