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
  version "0.1.918"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.918/veryfront-macos-arm64"
      sha256 "5e8a3fbcb55816bd5f6d93857b81677d9847877088a8cdfba69178aaf6c9ced8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.918/veryfront-macos-x64"
      sha256 "bc6a95bbb9b65bdd3d81048306720aee42949c9276fc01035251aca236398c40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.918/veryfront-linux-arm64"
      sha256 "63044a356ab9fe6a2927bdfdb7f6d12b8f2b716282bcd301e44be086bbb74154"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.918/veryfront-linux-x64"
      sha256 "1f9808a62e63dc85067f722408fe51b6e13e438b7caf02553f20a0137cb80c68"
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
