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
  version "0.1.757"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.757/veryfront-macos-arm64"
      sha256 "ee17b55903e23f70f55701a465d32b2294a99b359d454b6958ecc17b3b0b07af"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.757/veryfront-macos-x64"
      sha256 "79ccd2998e802177948c8dee1a9ff81ede2782d2728b6b37d585678c34dc9e5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.757/veryfront-linux-arm64"
      sha256 "6f28551455013f6c059a920ecd7fe78a71d71ce1acfec775db2ff0136a47367d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.757/veryfront-linux-x64"
      sha256 "27a4fcfe4f12d98c1f847eb239cc5b0053ab1e6fc5d9b894b1558451d5f0e860"
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
