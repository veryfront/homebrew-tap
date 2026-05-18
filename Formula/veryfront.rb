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
  version "0.1.554"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.554/veryfront-macos-arm64"
      sha256 "65af1241e67fc577815f90850fc85eb629302246608f41f040150684f4b1dc2d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.554/veryfront-macos-x64"
      sha256 "6d690c359cdb4a7d72f8a9cc29fef38ba02eb64051d02adb663a3a84a9281435"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.554/veryfront-linux-arm64"
      sha256 "87ad05d15fc94dd1ddb73fbafff2d4f0feec31f0cfe1b63e5f8876c4953a76f5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.554/veryfront-linux-x64"
      sha256 "2e4ee45a6cc1933fd42a7b570ce4284ed21c4b471ca55f5be7316bf9ecf4373b"
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
