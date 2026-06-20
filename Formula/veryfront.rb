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
  version "0.1.878"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.878/veryfront-macos-arm64"
      sha256 "82cbd27e2c45705288887f622248f4e79723cdfbc1cff999473263e6a37ff149"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.878/veryfront-macos-x64"
      sha256 "1cf5552b201cf0dd278425c194b3e44a8ec3094a197070c46887cf4bab64ac11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.878/veryfront-linux-arm64"
      sha256 "b80d1909a33a1fb5ccdd4670511bfd7d2974bebada4085a754ef3e68f308ae55"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.878/veryfront-linux-x64"
      sha256 "70f7a2ce2e29a489b515da4afb5848a8db80a5c19e74da6fafb42047e771d2d6"
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
