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
  version "0.1.352"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.352/veryfront-macos-arm64"
      sha256 "91069b54c27dd76aba6c37cfb17b5146bf9fc8200bfe0ac0f0634a24b34ac1e5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.352/veryfront-macos-x64"
      sha256 "dcba2e9c0238f9a5f737a74aa7bcfb8b71a0b950af7dd33ae89582c51460ee3d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.352/veryfront-linux-arm64"
      sha256 "4142f65c11f3324cf609af6eeaa50294d02f6116e74c1b5204cdc3188e7199f2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.352/veryfront-linux-x64"
      sha256 "7ff2a2ccbc865ac09a3f306d6d0ee94c3d6830901fc5740ff49dff82a6119ceb"
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
