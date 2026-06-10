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
  version "0.1.748"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.748/veryfront-macos-arm64"
      sha256 "12d0639516719d4ccd82eaa7c2aa0b9fa4bc24b170712e8e8d27f32f47ab2753"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.748/veryfront-macos-x64"
      sha256 "d61ca5e4cf09ca222b2bbc258dff2549ac22b89e6275f0305febf096d6625224"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.748/veryfront-linux-arm64"
      sha256 "7e30c1c1bd948ec22522f5df8e78c039f63e925805184291ea71a980c2df6b81"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.748/veryfront-linux-x64"
      sha256 "6650f7e0bc2b1cf25c8eacba82e0689005b0d6fa9883ba2c44f5f37bad9d001f"
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
