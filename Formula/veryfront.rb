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
  version "0.1.892"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.892/veryfront-macos-arm64"
      sha256 "bef31318f89ff3a4d12f225572a9cc227fd90b49a6724063d1ff999d97e2c6b3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.892/veryfront-macos-x64"
      sha256 "966eb6e1ddaf4ae382686de145d233c5e4ef2131221ce815039c96074cb5a42e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.892/veryfront-linux-arm64"
      sha256 "ed46edff418e767fa086abb075d3908785f97df31be8c590d68ba7576d48ac4f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.892/veryfront-linux-x64"
      sha256 "c89e5c03f32351ad637f227f119e0b7b4c967377fd193afa25b193e5ac35e3cb"
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
