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
  version "0.1.947"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.947/veryfront-macos-arm64"
      sha256 "15533224fdf32b08692ec4fd308c07056ab5407a3eb9031a9f47338eac9292c2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.947/veryfront-macos-x64"
      sha256 "3280448dedd47454e4c5797b9300029306b6bc4c3dbacc5e328700a09fb27c54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.947/veryfront-linux-arm64"
      sha256 "2e054f4bc6caeff6f80b50db3a4b153cd19300de6413f59dfbca1c60fcec12d0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.947/veryfront-linux-x64"
      sha256 "45f94bfa809c969d806e39ff3b9956b07c355c568cfd10d3be8741048ad25cfd"
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
