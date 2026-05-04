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
  version "0.1.374"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.374/veryfront-macos-arm64"
      sha256 "f242facd5e6d4b946bcf95db39a67fa47026a1e1e0161f7f5c50a96839d150f7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.374/veryfront-macos-x64"
      sha256 "b247d11f2ceca70b98caac7e94ce2fa08fa520fbf16f019f38585fd83c3693d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.374/veryfront-linux-arm64"
      sha256 "d52456afcaff29c184b96c8fa6f9c6a64489b6ee662fcdf4157edaa6a4ebcd86"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.374/veryfront-linux-x64"
      sha256 "f7ac041ed44c169f17b781ea3d93ed193e73388bb32187602e5ea79f38f3fbb9"
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
