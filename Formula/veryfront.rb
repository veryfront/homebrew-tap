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
  version "0.1.1152"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1152/veryfront-macos-arm64"
      sha256 "6b416955ea1debf09e3ce24eb4e743f35195671b3495e063288d5fa6ace612ce"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1152/veryfront-macos-x64"
      sha256 "f30be81c3b6f1b60ec19fb6ecc06ff138adb2abf7dd6d86100dd27e2b5c99e72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1152/veryfront-linux-arm64"
      sha256 "6e70338121a179d346cc9062848b5bd01c79bcda830503ad6eae0dc78ba1a104"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1152/veryfront-linux-x64"
      sha256 "64a9669457728f3a35264d3156f844197474f0edb87ec7896b8c7a5fde40b7ec"
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
