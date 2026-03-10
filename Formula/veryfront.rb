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
  version "0.1.53"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.53/veryfront-macos-arm64"
      sha256 "ee4e3859fb5dc898bac1aca041700d78a8524555444c567eaac415704c7c65ad"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.53/veryfront-macos-x64"
      sha256 "afc0d7f7e709c14fc822d666e71d2814f073379c4bdb7f2e465dd019e0b5cdbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.53/veryfront-linux-arm64"
      sha256 "4aaf7df3bcece5ff712a5310dfb85deb523157c48b3d53a51ec336364d0b8c36"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.53/veryfront-linux-x64"
      sha256 "65374a117aef71c619901aebb24e0ed062f5c8872cf8c902ee85581777d46615"
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
