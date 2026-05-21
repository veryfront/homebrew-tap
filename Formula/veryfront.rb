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
  version "0.1.567"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.567/veryfront-macos-arm64"
      sha256 "053e5233a911fc3d31ca37d2fabab93c2d62d5021282227a4e2536643263781a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.567/veryfront-macos-x64"
      sha256 "fbca4756db0466947e3711090ca6cb4fdddcaedd60bb7efa1fb53c194b8d8383"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.567/veryfront-linux-arm64"
      sha256 "03b4ddf1a095cdfcb3f2600361ac3ebd7625d299f305fcce3e2d7f9ac1899a95"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.567/veryfront-linux-x64"
      sha256 "cd76b70aa153f2ba307db965e46cb7441d33ec36cef3a9dd48cabf6b8defccba"
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
