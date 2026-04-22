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
  version "0.1.247"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.247/veryfront-macos-arm64"
      sha256 "3280c97c3a89ec9ff8f9fb212718a58dc794c2fe4445d94e41b95bf63f5dc69e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.247/veryfront-macos-x64"
      sha256 "d63161f010726093ae21185a456e3360d86f09b4581c5b587b26ab910fc17642"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.247/veryfront-linux-arm64"
      sha256 "43aa6ecc294199070eaf7e5f2430068cefd42accb6f05f2ba4809559784bf841"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.247/veryfront-linux-x64"
      sha256 "3431a2acba7a079e2c9d09c55b60b0e407d718849aa528a4afb3303d216f2b5b"
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
