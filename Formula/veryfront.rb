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
  version "0.1.595"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.595/veryfront-macos-arm64"
      sha256 "c241f1672b4485d70e049cef17b4d99fc14f83c98fc80ef7457447206dcd51cb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.595/veryfront-macos-x64"
      sha256 "6903bea7056e650fc443c45b097f27ea156e4fcecfde6e7e316aea0c0df246ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.595/veryfront-linux-arm64"
      sha256 "f1121836507dad85ded4be915fdfd1489aa7e710144bde2644065378d136c7ad"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.595/veryfront-linux-x64"
      sha256 "7f349831929d8907472f097bf8374bf594ee723e69d38fc062044f0ff40ba487"
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
