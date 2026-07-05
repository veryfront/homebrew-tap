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
  version "0.1.1009"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1009/veryfront-macos-arm64"
      sha256 "e95b6c61ed28d01c14b8a5f5730f0c738914390a7ee4ae7e7e119475f694df8b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1009/veryfront-macos-x64"
      sha256 "f1cdc7d9e2fb87e1cb6f63ccb33daf107d5bc2be640e2825f3f7a90ec05dbf80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1009/veryfront-linux-arm64"
      sha256 "b3ef8bb14d320b33f134ac6b1d11bf6ce2beba9b7fa072fbfdbf64cdb636f9a9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1009/veryfront-linux-x64"
      sha256 "448610e06416982035f6c412ac58cad517a99a01229afebff744527cf9208cb7"
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
