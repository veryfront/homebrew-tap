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
  version "0.1.951"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.951/veryfront-macos-arm64"
      sha256 "bd5f2c09ebadc1b3d973736eb3883f1ee1e6f67047f660d21382df0bd9315c19"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.951/veryfront-macos-x64"
      sha256 "dff11829979a77f4a1c7dab7d7f1dd8fc53b00e4fadc8f00deb0dfd404897fe3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.951/veryfront-linux-arm64"
      sha256 "2a77e3cc5547dbd1bfeaed291e63be859536bb55231341ee170d14cfd6ec5fd3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.951/veryfront-linux-x64"
      sha256 "cd7ae8d9a5b4ef1fd6855e8efe41c82056fb9ac1844e33f0adc6f9755e2b95a8"
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
