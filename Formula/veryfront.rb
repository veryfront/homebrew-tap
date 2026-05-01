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
  version "0.1.337"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.337/veryfront-macos-arm64"
      sha256 "6748f6b694b41768d2ab138cff0370c7ff84af25980e7a9f8416ca37f127f29d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.337/veryfront-macos-x64"
      sha256 "2dd6c8e27dea38f9d22126a3126ff2fca71c19036d2fc6e1ee01669a74fe5b76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.337/veryfront-linux-arm64"
      sha256 "b018b40a6ce009daeb030727d57d68be8062e2b9ffd547a9fec8b274821c08e6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.337/veryfront-linux-x64"
      sha256 "53d496b79acd8cade41abefd4bd2b9c5b50989e380daf737dad820b39c2b50f0"
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
