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
  version "0.1.585"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.585/veryfront-macos-arm64"
      sha256 "06b45b67b68a5b316311b171e58dc2edbbab6f7720dffbe1fa960051cd773331"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.585/veryfront-macos-x64"
      sha256 "92689bb1ea4456e9d5446f641d4d9c8942e8a743e704e5975af3f12952db3b62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.585/veryfront-linux-arm64"
      sha256 "66f6898552aa60a6c6bd4d5319fcb5515456d86fee2b978672773732ee8803ec"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.585/veryfront-linux-x64"
      sha256 "6d80e9ff563eba4a3ebbdbda1488927485e2563d0ab56c56bd59648aa076f83c"
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
