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
  version "0.1.1194"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1194/veryfront-macos-arm64"
      sha256 "b6ab3758358b33363a7a50fcf38ede3a2d35d7798df54901ec0f34504c6d5517"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1194/veryfront-macos-x64"
      sha256 "a80ee1a1767de08b3ff22e2bdd27d2ef26251168371d7a9e85397799c6d1134a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1194/veryfront-linux-arm64"
      sha256 "7be3c7eb883a96fd822938374dfb27953b924760851511de94e9e440dce46238"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1194/veryfront-linux-x64"
      sha256 "51289b34f6787754d2d31481633693643af2cc847b772def21c79b702a3fe73c"
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
