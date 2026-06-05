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
  version "0.1.669"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.669/veryfront-macos-arm64"
      sha256 "3b0c2d47a3d39f5e67968df0d1e420d1aca0fe5fe0267f2262073be219bf2e24"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.669/veryfront-macos-x64"
      sha256 "791756586dca601bc7b1701c883f775dd6b423b22d4121901d97b28bc9c57a90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.669/veryfront-linux-arm64"
      sha256 "9d1be4251889e84381ecbd6348fea87b824c96b50c5ca88f2cd0bbff67ca1f03"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.669/veryfront-linux-x64"
      sha256 "8ef0641b4d169d93b9336b032abd1dff98bf9c98ad375c50b8dd828b9fa7422e"
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
