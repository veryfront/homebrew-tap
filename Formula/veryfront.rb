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
  version "0.1.372"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.372/veryfront-macos-arm64"
      sha256 "2b71ac29982962a031be2327bd63802433bd80235d5fa9bffbe5900184126d11"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.372/veryfront-macos-x64"
      sha256 "05dad4eab016172b5c085fc7db55076c715b62ddfde568fa8a237ce11ca0a715"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.372/veryfront-linux-arm64"
      sha256 "9d1796b74cd816d7f7bf0d34c5777ca0f7c3c27cdaab336c13ea49cc4ee06435"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.372/veryfront-linux-x64"
      sha256 "a0b13cda4b9e96a2eb312b9809e2c7a2b7745be1421b91491ab48817db30b1ae"
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
