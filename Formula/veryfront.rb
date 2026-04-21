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
  version "0.1.235"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.235/veryfront-macos-arm64"
      sha256 "ae71da85de1794270a825ee46fb6a449bb2a18ab8e11d5857d809367ba2444cb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.235/veryfront-macos-x64"
      sha256 "777707b347e34e89ce85affb810f1b0d827efd2092530d73ab83ab8279b710d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.235/veryfront-linux-arm64"
      sha256 "a37a219a2472db5ba53c4e8d2fcd5f03e82212eda871b02f2ab4781cf8e7502d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.235/veryfront-linux-x64"
      sha256 "74d2af0b034f2f5203c51bc5f72219de2ef7b171275047de79c519490da2a21b"
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
