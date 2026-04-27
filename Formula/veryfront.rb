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
  version "0.1.284"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.284/veryfront-macos-arm64"
      sha256 "364cec95309437e1224381f2f883b290b9e1ec1027b40161509517171baab37b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.284/veryfront-macos-x64"
      sha256 "dd2ce0c06915b7593031c5f2503ae61e4c5d14f99df0d51bfffa06a9b4009cfd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.284/veryfront-linux-arm64"
      sha256 "33c43abbf25ee309cf5073e7a1dc30d6ade0cff90f2e6a0f0bdd7264ee58c6ea"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.284/veryfront-linux-x64"
      sha256 "957c085b4ad06186b5816f49df6e580f9b5cc965f1ef6312450c6ada234ae341"
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
