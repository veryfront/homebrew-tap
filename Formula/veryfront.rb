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
  version "0.1.1212"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1212/veryfront-macos-arm64"
      sha256 "290a37affb956f7a788ba4f098c5ec9fa9ba23d972ce40fbd62f83c6382b3c46"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1212/veryfront-macos-x64"
      sha256 "b380f4efcec575772585ca2555a577e4f25ed75f93fe4a8e69cec4928a00d108"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1212/veryfront-linux-arm64"
      sha256 "15adfc58d567842ec816019467b6021ede7f92d0e9de26626af3b92c4ee8aeda"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1212/veryfront-linux-x64"
      sha256 "6475f6a47ba6fdec2e54f37426d22b8023385f0bf34b4f1179d102c2e3d3b362"
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
