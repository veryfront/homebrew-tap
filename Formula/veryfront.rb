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
  version "0.1.287"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.287/veryfront-macos-arm64"
      sha256 "aeea792a6ac3849215c6e69525d3751bc4e451aa2be25f417c28b7ca916fa0ed"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.287/veryfront-macos-x64"
      sha256 "d6688d547654b06af2f208a7848fed8e918edd3c0a504140225e69345652cb87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.287/veryfront-linux-arm64"
      sha256 "12ffaa19635b8406ec8bc95a7f976e368806fc73bf575eb6abe71e1ac1265f95"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.287/veryfront-linux-x64"
      sha256 "2b7a772423c94c54961c50dabbe6c3473f78c5ba87b9d4480a5b961c49f35676"
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
