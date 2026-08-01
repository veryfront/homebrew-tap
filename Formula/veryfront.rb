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
  version "0.1.1181"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1181/veryfront-macos-arm64"
      sha256 "e44e0aaae3da7852a5fd2be9b26d1d2c2f35ab952027ce6bd8029df74de9000c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1181/veryfront-macos-x64"
      sha256 "e6c9cd56b219f9ed94a9bdb2d42342794ec5b2bff90e7390486789ac819cd42d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1181/veryfront-linux-arm64"
      sha256 "5c985782b46fd976908b67b9c669704bdc5b2a46ae7e19f0ce443f16f53d46cb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1181/veryfront-linux-x64"
      sha256 "0823961f9639e1fa8065a91c768bdd4c3ec8d235d74e490356e0e758c7e2cc35"
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
