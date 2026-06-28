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
  version "0.1.964"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.964/veryfront-macos-arm64"
      sha256 "4236a8fe96e37a587ab4759f7f2e6b428ddf79c48b519523b949600a3d6e6be4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.964/veryfront-macos-x64"
      sha256 "c399a13ae743200b74ad7d2ab1ac8ad4d56db91d1b4675a1b17c33004d65a3bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.964/veryfront-linux-arm64"
      sha256 "25643bdf163e39b37d721ce10d104a06d37d5ff8886224ca269e4ff1afaff968"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.964/veryfront-linux-x64"
      sha256 "3b0da765746d8fc7882e27d43f036e4e66081b9522e35d07755783de3f271338"
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
