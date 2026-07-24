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
  version "0.1.1128"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1128/veryfront-macos-arm64"
      sha256 "c59c3b663588d439c703ad91b2315dbb3b9917126f986475863c0c0dc0131d88"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1128/veryfront-macos-x64"
      sha256 "60d538db3b1d0e961c7f9acfa6291d70cd26df2a40c4f1dcb07450e07fa5d655"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1128/veryfront-linux-arm64"
      sha256 "c18413fe967cc1102b260fffc6b03d25ac707da105e6c9b48c394b9211d60db4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1128/veryfront-linux-x64"
      sha256 "642b19ec7ab84111fb3f3c029a27901bd530fdf90c84911b8dd25d5fdf1a9991"
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
