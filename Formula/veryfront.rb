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
  version "0.1.1155"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1155/veryfront-macos-arm64"
      sha256 "896a83ecee76fe43f029c5c1054015c7571b15bf08e2cc2fb7eddf856664c6e0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1155/veryfront-macos-x64"
      sha256 "88c6293d547c93c1878509e81cddda7749552157e72af9d11783db64280743d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1155/veryfront-linux-arm64"
      sha256 "5952d3cca2bcd9cb1155f46c633c0141d4418260094f6345ca4f5798e816f95a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1155/veryfront-linux-x64"
      sha256 "d16cbca3d35ff694f0fd1bbea21d7fa592824326fdb5fec07b9dc36bc5ceaaa7"
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
