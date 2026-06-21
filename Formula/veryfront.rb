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
  version "0.1.889"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.889/veryfront-macos-arm64"
      sha256 "392992af5c522b282781a8e797e941fd54419bbaea69e10ac196904d0dbc8716"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.889/veryfront-macos-x64"
      sha256 "1a77a4ea7668523185b8d1a82e190e44ef1d43a5586ddc878fb321a8e57d9406"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.889/veryfront-linux-arm64"
      sha256 "d1a3143d55a19662a3458502d9379637d1f05959193730d38e76d76d368eb8cd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.889/veryfront-linux-x64"
      sha256 "0af91569e3392cee36f110b0a578a0cf54b90672c82bd7b0460f05c141fa62cb"
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
