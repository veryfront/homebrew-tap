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
  version "0.1.888"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.888/veryfront-macos-arm64"
      sha256 "8cdc73782e7e757bf890d7ee8fe5e63d48915f1c8c19dcb6331e02654222d402"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.888/veryfront-macos-x64"
      sha256 "5cbce09846e31cb0271783b5a2c50869109c50e40ebc31ccd6df3a9242613c6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.888/veryfront-linux-arm64"
      sha256 "3a1a431e462703f8ad665631e87172adbedb4ea567ea53fb7c27fa0195a06968"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.888/veryfront-linux-x64"
      sha256 "7e0f0b61cb95179a088f580c7f7fa0aed585e4adf887c03cfea1d34d46026786"
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
