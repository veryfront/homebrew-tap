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
  version "0.1.94"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.94/veryfront-macos-arm64"
      sha256 "9ff08052e76626f9c7eaaefc01c1cb64b4c1b9583ab2c0a992c6a97277db413b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.94/veryfront-macos-x64"
      sha256 "20725a2221bd6c6beb54f405ccf86eee591e7dedcf3ec76e84c5cfe12390a5de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.94/veryfront-linux-arm64"
      sha256 "a35d1b157f4a8ae846bbcc767d12390f94b001925d1b743ce86d203ee1bc65f1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.94/veryfront-linux-x64"
      sha256 "237e075cee3cf30b9a5f486ebd0343e396c995f40905432594492e19f9b31b3f"
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
