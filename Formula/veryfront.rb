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
  version "0.1.569"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.569/veryfront-macos-arm64"
      sha256 "6d3000b3cb37c3e34ec30821865d25223233b37864ee2f38fd2511a42dd0b42e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.569/veryfront-macos-x64"
      sha256 "9da823fcfa20c04a1814aa8f630a8d4c3c83ed76b2819dd8877bb230d3c98cba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.569/veryfront-linux-arm64"
      sha256 "b1d78be03472aa07f16016c22bfe96ecf504caa7560343ff390e41691d1e2116"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.569/veryfront-linux-x64"
      sha256 "3a15325dc0677935d011f535af695da34010366e3720ff9c87b4e92a8a1a8f11"
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
