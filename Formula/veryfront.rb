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
  version "0.1.789"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.789/veryfront-macos-arm64"
      sha256 "3ecbaab7c322b144843eb611faa0e43a0d40b3ecbf2ebcff64ebd3848a9bb8f6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.789/veryfront-macos-x64"
      sha256 "7982e947202a70c6b7c4236d6277eeded1c35471ad3035d7e1984864b30eee2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.789/veryfront-linux-arm64"
      sha256 "96d6ba3d9e22eeae61664bf169ee9a9485790299ef9033516e5ddf50b9eb8a33"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.789/veryfront-linux-x64"
      sha256 "ebb0c53a912d21d555bcefbf479753c109e6a29b5bf541c90f4b0a524ac69533"
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
