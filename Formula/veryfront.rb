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
  version "0.1.1048"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1048/veryfront-macos-arm64"
      sha256 "81d89bd5078ebe0f68b694ee339fc78822ecef51c881c7d584a6902d783169b5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1048/veryfront-macos-x64"
      sha256 "071603ce5573499a03915306f734b31ad4eb89e7897db3cb49c9226ae7422c7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1048/veryfront-linux-arm64"
      sha256 "c68db2402077ab2b4bc698d34f1f3fa14f0625bdfa6dfe9a8f1165e4922912b9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1048/veryfront-linux-x64"
      sha256 "89322efac9e2fab1beae90cf3479c24810b7615df604c766483e0ec7de34bd3d"
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
