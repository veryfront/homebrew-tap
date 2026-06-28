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
  version "0.1.966"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.966/veryfront-macos-arm64"
      sha256 "116b908e8c817a951d91a315c31369432437e5544f42a7cbebb042d1f531e848"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.966/veryfront-macos-x64"
      sha256 "05f9c25985aa5273499bde6a148b64d85eb2e80dfca64bdb51b7f20ba6d459f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.966/veryfront-linux-arm64"
      sha256 "715ed5d85823154e09fca7c82b72daf1f43512fcf0f8429ce37433798eda28c0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.966/veryfront-linux-x64"
      sha256 "99851ad7142630ac1903ee726bbe874f79696675665203ab838128c76bd1940d"
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
