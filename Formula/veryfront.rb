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
  version "0.1.771"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.771/veryfront-macos-arm64"
      sha256 "0715e8b90f724be07e377d8b10dc5c184b2f1220534f8542e315d7225cf437bd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.771/veryfront-macos-x64"
      sha256 "7d44f70c230fd709a25790a9b7173407154584be37fd18239121930f2b505ed2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.771/veryfront-linux-arm64"
      sha256 "6d3b168b1b8cb92f0aacb95442d1631e2cad08ea87dde7b753ee7496862f8b2e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.771/veryfront-linux-x64"
      sha256 "7d12085258675903700cdd39c36f70c52c0d9e6699089508b5271bd9a1b7834b"
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
