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
  version "0.1.353"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.353/veryfront-macos-arm64"
      sha256 "eff136e0a8173853695bd991b6386c326954aced363c2eb7b1c6d0b88b44fc81"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.353/veryfront-macos-x64"
      sha256 "9252a8a19d9c1cb6665a36970b7cd858492b1c9c3c860d2e7073c8a677530dde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.353/veryfront-linux-arm64"
      sha256 "315cdaada7bef26fc9a7eef67f0cf940f5d033018b7b1f185f77dc309f930f29"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.353/veryfront-linux-x64"
      sha256 "d2c9eba7785ead98bb858171d86422e855dba09ea8b91fa82d07b967a40c20fe"
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
