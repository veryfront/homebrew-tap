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
  version "0.1.397"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.397/veryfront-macos-arm64"
      sha256 "e4b52697d69ecb6ab4a067351160f3cd439df76efbef41234192b867722a6d80"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.397/veryfront-macos-x64"
      sha256 "f9628030f18ac4a5698b7f0046428b429431cd18d0e1468297eb5cc851162e13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.397/veryfront-linux-arm64"
      sha256 "5b2faf45a395621977d8be4263cbb0d8233186eb82e5be280891750e98d51ae6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.397/veryfront-linux-x64"
      sha256 "e3e95ce96c68f8c8e269d0566f3d123edb890dc1ebdfb172ee8fe58897b2490e"
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
