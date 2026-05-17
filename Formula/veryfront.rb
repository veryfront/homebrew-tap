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
  version "0.1.548"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.548/veryfront-macos-arm64"
      sha256 "ab282cd67f4c2435399f42627ce1fdb10ab6fd9cb0e74ef5d582629477b97d99"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.548/veryfront-macos-x64"
      sha256 "411160eade9f5eadb4beaaca6681434ac2ca25d4c2b04030b617fe7cf58dd12e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.548/veryfront-linux-arm64"
      sha256 "30b837522f68eae57fbce8b5d981b08d5d6b9e05ea166f3814a507904e7d5458"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.548/veryfront-linux-x64"
      sha256 "f2024fd5fdf13f9db0bed306ebf7812cdd1354787bd4a47cb44b31bf02430634"
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
