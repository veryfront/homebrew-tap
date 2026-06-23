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
  version "0.1.914"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.914/veryfront-macos-arm64"
      sha256 "dae1b90884f764dbcfa92ef24487bcf9fb0204c2549a7f838a0fc877548d6bb7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.914/veryfront-macos-x64"
      sha256 "e8ee0311ad0fc0b0c191a8e6c076e2ab89b92af3c75d5fbf7088492fe30f0349"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.914/veryfront-linux-arm64"
      sha256 "9fe16004ee0de9d26933d5a188f72ea4b6afbfbd9bd3a3ac04e5935d56724cfd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.914/veryfront-linux-x64"
      sha256 "6c5b90c80ffcef11694dfe5bbfb634bc54e2c38a287dd3e6807ceae9bd22b051"
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
