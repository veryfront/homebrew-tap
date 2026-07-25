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
  version "0.1.1149"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1149/veryfront-macos-arm64"
      sha256 "0c6573924475c942537c4b90db42a0dc4f7acac51b61e1361b527278af435bbd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1149/veryfront-macos-x64"
      sha256 "561a000f72b208f66aa0ab1b9e6a823e6f623fc0c6699ffe5fd5b413846fc1e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1149/veryfront-linux-arm64"
      sha256 "09a62529fe7223cdb3ae94f9facc3a3c73a1e4f2c8f44a85d494bcfccf659cba"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1149/veryfront-linux-x64"
      sha256 "73c8cc12d553623b1733d4586d001c9548d94a4cb5e1f1fae0c6ed06817bbabf"
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
