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
  version "0.1.1091"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1091/veryfront-macos-arm64"
      sha256 "6ea3926b7b19b6694ef0a3736581cfc17571862fa423e1f9dc11b89379f347c8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1091/veryfront-macos-x64"
      sha256 "8ace366dc5f47ef962615fa47562a36336637ef8f71ad65eecd479322af53d14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1091/veryfront-linux-arm64"
      sha256 "3a9cbe3b5c5d5df5fa79266a53502e9400be342c5b9e0b2b0b4fa3af884d1027"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1091/veryfront-linux-x64"
      sha256 "80003c52ae26051187546911fcb1ec2a3f88908e77fc5c3e23495060618497ee"
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
