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
  version "0.1.299"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.299/veryfront-macos-arm64"
      sha256 "f4e9f01d8f7341275d4ae2a324134e178c92dfe7eb75b3a7ccd3d1002509f934"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.299/veryfront-macos-x64"
      sha256 "63891b2ee486012220dd5c23d94c6f056428b3776087e56fd563e1c7be3eab91"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.299/veryfront-linux-arm64"
      sha256 "58c1bbf0bf5176c7634ea6da1139fb4cce555d6114fbe9e256b706beef464040"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.299/veryfront-linux-x64"
      sha256 "11113998dca6285ef2de104bd018d4887c4231b1e9cd46e6be4f80c71ae3c136"
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
