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
  version "0.1.693"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.693/veryfront-macos-arm64"
      sha256 "63d796ac08ed56d0f5a793e6e1019fb5bf8403659483835ec67d5b15da2c9617"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.693/veryfront-macos-x64"
      sha256 "0237a1779c3b057273491f4bf63255f20f9c54f3aabad3140ec7c687d548b028"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.693/veryfront-linux-arm64"
      sha256 "4c3de389edf5bc98257a1f51188fdbb77fea59a4f4b9cbd7905edf0ac1ceb9ca"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.693/veryfront-linux-x64"
      sha256 "ca6fa5c40ea38c3f1e8118994e4290baf97a5cc9f79ea2add303a3959a4eb234"
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
