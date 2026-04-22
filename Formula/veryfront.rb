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
  version "0.1.248"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.248/veryfront-macos-arm64"
      sha256 "a56fa538eed5e84e607e4937b38d930ada6f7e8edf6c60cbc98db7b7ca412e89"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.248/veryfront-macos-x64"
      sha256 "10799c55a47f6d9deee1268735c374f138c28b29128d1bf859d245751f72553e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.248/veryfront-linux-arm64"
      sha256 "e58664625a24ed905da54e9141dbc76fd65d7afaf2298accd7d649975114df7a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.248/veryfront-linux-x64"
      sha256 "9c3511756e3aa3b2b2943a1eb5b91f01bb78bcf093f0ad974728c45b1c3a8452"
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
