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
  version "0.1.953"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.953/veryfront-macos-arm64"
      sha256 "da6ae58a7389f9be2257009c8c128412374544c3af96c982ab6dc2660d42c03f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.953/veryfront-macos-x64"
      sha256 "4203cd88af765d1e7069387810059afc4e05c8430b943255501688db3fa061ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.953/veryfront-linux-arm64"
      sha256 "f4fae04b24192d61a3d37cd4517c6d5a6ff3cf27ab5f871e57b5ca7c108dcc54"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.953/veryfront-linux-x64"
      sha256 "e3e3c36df11014f5fc3f28725ef22f2e6aecf33bda24925e75cacf3d74dd5e53"
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
