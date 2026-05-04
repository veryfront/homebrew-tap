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
  version "0.1.373"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.373/veryfront-macos-arm64"
      sha256 "edcc2dc1ab04bebe94a01873ac970f6fd2fea2cd4daa59ec3e8c87698f7f4aa8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.373/veryfront-macos-x64"
      sha256 "eb1ff32f87b45ea2284aac030e47c24c30b6e15c18e22196aa959af15d918e41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.373/veryfront-linux-arm64"
      sha256 "18b3075c2cd32173d76ba1266f1de7daaf1e7add0ab2c528e4b88e7945087b27"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.373/veryfront-linux-x64"
      sha256 "5cd2052c326a7b663ddea64093222e9ca12791d7a92501a4bd7037777e69b310"
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
