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
  version "0.1.941"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.941/veryfront-macos-arm64"
      sha256 "5b16d162a97030bde56019c4d1bb10cec2de8207de20b92264381ec0f101057f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.941/veryfront-macos-x64"
      sha256 "aec99bf296eeaa05e059acc0e94f800951dc0d73ea6201410d09fa34763e889f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.941/veryfront-linux-arm64"
      sha256 "c4bc010f0e84f10362ec993d8ee693458bc23fd9a2fa4ac84aef7fb5821bfac6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.941/veryfront-linux-x64"
      sha256 "244c2ad1fb2b6230484ba2480f2c7770c02b134f74f82459e384712f3f468776"
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
