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
  version "0.1.1104"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1104/veryfront-macos-arm64"
      sha256 "34efdc8d07f1744a6f2c19caf0df297b169cfd5b9641e952161b8c297fd17889"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1104/veryfront-macos-x64"
      sha256 "db4612571afe68a9d5eb8c2077e0be162063e681d0e549c3ff183b6ccf9afa20"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1104/veryfront-linux-arm64"
      sha256 "1c66f14ca4f6dcee9934a6496b3105d7b9f90568ecf1762d75735ef41c477ea8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1104/veryfront-linux-x64"
      sha256 "7a1ccaf5764ec69b74a036f6125d43a1a0bd96b3575df62d4d4775c29b85a769"
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
