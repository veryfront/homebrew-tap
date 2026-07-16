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
  version "0.1.1079"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1079/veryfront-macos-arm64"
      sha256 "ed874aa34f57df8afb8f6edb68721bcd560be8e44e33074daab1dc6626111331"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1079/veryfront-macos-x64"
      sha256 "f2cd786874474cfe7f84194f50eb7cbad19dfaf5a40b7a0f1b7d82a67016e55f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1079/veryfront-linux-arm64"
      sha256 "cf04f91bc5b7297f9137be0d21b41b0a11022a5728e361bc6cfee6a22122555f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1079/veryfront-linux-x64"
      sha256 "856d7e22cf18787ea772ee8b1cd74ac049011ce57953c65847c64e161763d794"
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
