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
  version "0.1.214"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.214/veryfront-macos-arm64"
      sha256 "02f16ba24b6bfc7dbb4a7114d58f5595106e00e668e1dab7aaab3ca689ecba4d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.214/veryfront-macos-x64"
      sha256 "b36b111b1df1b728c18da0d3ccd9c47957d5750a566dfff772c683d360edcc5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.214/veryfront-linux-arm64"
      sha256 "82cb42db699f4822c1dfe834d28ed9d80131c9cc5e3960845f7a09818388154d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.214/veryfront-linux-x64"
      sha256 "7a251f3475fd9b211c44b30ba48779a735d35abdd6b19625b345973adc3b7234"
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
