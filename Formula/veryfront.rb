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
  version "0.1.1114"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1114/veryfront-macos-arm64"
      sha256 "c9b29f2ae6d11c878f22fe5232a1c58f7890d7f6501e6342f83d7ce0878d5e9f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1114/veryfront-macos-x64"
      sha256 "734eeec01c616a095878713b104996e01b7baede99abc9f4d0788e950da0598b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1114/veryfront-linux-arm64"
      sha256 "502fd23bb148e94f6639710da5810694833799611a095f096e94d04dc8df547b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1114/veryfront-linux-x64"
      sha256 "fd811350c82331c28a433cd329ab12b19853dbf93bfd840fd69d12624cc42295"
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
