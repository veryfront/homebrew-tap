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
  version "0.1.275"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.275/veryfront-macos-arm64"
      sha256 "8a77ecb9e09a1038f059b8722043e42872e5fcbfd0c3f17e71cb842927dd5579"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.275/veryfront-macos-x64"
      sha256 "f3bc3e48da3cf5b5c760953556dc04b3d69c33b1f52a1213ec66634ef1df85a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.275/veryfront-linux-arm64"
      sha256 "9de4f4013f3d09c480ed3eaa3c6c1949d7b62ab2c80c6d4bbfdc57f2ffa4c98a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.275/veryfront-linux-x64"
      sha256 "314430dfbc61b687d03d1373e8430ecd1ef7269f7b6db2821e1404c02910444b"
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
