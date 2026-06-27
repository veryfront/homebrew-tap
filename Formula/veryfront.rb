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
  version "0.1.954"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.954/veryfront-macos-arm64"
      sha256 "ddf5fbdefaf6a5668583268d294e3373fe679f8f56365833787eff4d72e0e601"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.954/veryfront-macos-x64"
      sha256 "fd26f822509077ef42acd82f8b4c675aab357577c59f9912262b5d5289fac355"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.954/veryfront-linux-arm64"
      sha256 "136d73ead6a19b3d78fb5b14cbc6888f7eda474da12845134c1150fd2007615c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.954/veryfront-linux-x64"
      sha256 "b4a126425ea87337afce926c89bff111b7a05fc3b3d5ea178ae12f241074bc7a"
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
