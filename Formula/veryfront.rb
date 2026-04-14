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
  version "0.1.205"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.205/veryfront-macos-arm64"
      sha256 "7712ad2eb3d88c9957da944ec1cd549654318878a2950fa92175ff36869f7f5b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.205/veryfront-macos-x64"
      sha256 "43d229aeefa63d99ce5e1679f2b4401ee7319211ee8e68764d7675b5f17d5f25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.205/veryfront-linux-arm64"
      sha256 "a7b2cbc2ad4dd88ce7f46144779d8fbeadc935d7e0378d1fe504c4d6538eda45"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.205/veryfront-linux-x64"
      sha256 "b56e84d7406fadd100dbdca201374cb610cc4c5b3a269156802e87b1c1878ecb"
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
