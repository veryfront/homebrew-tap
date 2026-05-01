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
  version "0.1.342"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.342/veryfront-macos-arm64"
      sha256 "8dd15e4199bbe4f63f8067e56ba2435e8d18492dae5def101905466811a035cd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.342/veryfront-macos-x64"
      sha256 "b95fecfd2895788fc76f1e7aa950e82522b20c9e893107a1fda728b1d43a5c5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.342/veryfront-linux-arm64"
      sha256 "5d77b3a5bb435891318b8fa8d2e5d1fadb35a29e24a6c02057d051ba810f30e1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.342/veryfront-linux-x64"
      sha256 "119983f3e29d3906f30f852faf47a22a9f149ab92b6059a44c80aee8ee74c6bf"
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
