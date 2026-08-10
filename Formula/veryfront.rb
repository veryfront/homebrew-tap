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
  version "0.1.1227"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1227/veryfront-macos-arm64"
      sha256 "3590a405d55edeb7ecdb6b3dc54576ce53945171b383ba6280b6d5abd4c86e45"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1227/veryfront-macos-x64"
      sha256 "119646cebd1ea02ae2aae55c803f5dacc2adc89afdb5087cd5f9fa69edfb680b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1227/veryfront-linux-arm64"
      sha256 "c20cd92365e9369404e4ad75c51b1a80d857b8e0897987126d964c762e2ce79b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1227/veryfront-linux-x64"
      sha256 "0504f8f635bccbec046b3a873fc0d42b42f10088edb757b9b456125c779a2814"
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
