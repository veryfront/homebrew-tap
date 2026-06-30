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
  version "0.1.981"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.981/veryfront-macos-arm64"
      sha256 "e6c9b02f54fd87ad3e38cc18274031b25bfa3e20e91698f68297f7dc75637732"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.981/veryfront-macos-x64"
      sha256 "4312b1c5939d1046a8342c156e0b72bbe45924ec2e24e72b5394a38c96fd77dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.981/veryfront-linux-arm64"
      sha256 "f395041969e404ef2cc8aac46b923199edd0dc52fbb02e3521e1ed92128c356c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.981/veryfront-linux-x64"
      sha256 "bde0dad093af14a297eae54b872cf9c5c74e1290a5e652b652b80a0ec96bf53e"
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
