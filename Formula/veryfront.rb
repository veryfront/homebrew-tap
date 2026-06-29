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
  version "0.1.976"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.976/veryfront-macos-arm64"
      sha256 "8d5cb4c67956228e7d77c9341f119b88ffcb89204aafcec231593f35312bc2fb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.976/veryfront-macos-x64"
      sha256 "1d78f8f10066f25bec2e2408246c1c07466c41e5f24c6b66957f2b69ba51d162"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.976/veryfront-linux-arm64"
      sha256 "1fd1ef7706610408c99237243b2e0541a484284126d0905c0cb9335eaff287e4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.976/veryfront-linux-x64"
      sha256 "4c8cb1b428d19d36686d2a94fed88c6c6139ee25bac69d9db1d9f982def0e38f"
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
