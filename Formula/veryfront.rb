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
  version "0.1.29"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.29/veryfront-macos-arm64"
      sha256 "237e64034ade95d88468a4d1aefaf46b5dd3dc8c31081bdba7db0c35348aebc0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.29/veryfront-macos-x64"
      sha256 "8a72ca09ada172e872ddd8a2186b2e39498f761844fba1b17e82446613de69a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.29/veryfront-linux-arm64"
      sha256 "a098f6e8f6008c0573f203392dd4801bb4d9e3ae4a7e031c047fddd9476962dd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.29/veryfront-linux-x64"
      sha256 "0ebd6e3cd17ebc339fdd7da0058b97196f1ac99320231523e0b0a7236a70f31e"
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
