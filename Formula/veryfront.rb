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
  version "0.1.431"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.431/veryfront-macos-arm64"
      sha256 "9811ed63925731b4fbf8340546e51461a33649d710671a1917a0d4bf59b74ae1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.431/veryfront-macos-x64"
      sha256 "7e308fd2c9c6309f2af395b68257bb94a7181b2d1fd93d60fd7bc2e0fa0fa1ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.431/veryfront-linux-arm64"
      sha256 "b4fdf74e74df32b41cf0f134ae7adf2b195de2df627bcb921a405b9919703827"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.431/veryfront-linux-x64"
      sha256 "70f7d016ecf6673303bc7bd6e5c5130f291ce1babcceae06998c02519dc03063"
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
