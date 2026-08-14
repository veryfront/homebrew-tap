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
  version "0.1.1238"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1238/veryfront-macos-arm64"
      sha256 "9f7abc8283e6f356cace28fbcac6603ce1398d83e82c31e10b99fb1db27bb6ae"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1238/veryfront-macos-x64"
      sha256 "81486a4e2a42d43c646d0ad1a924194c0d1413be457fc935aca7e61234059557"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1238/veryfront-linux-arm64"
      sha256 "d8e41e5210824e15d9c4d907fe42d07b81d131ad297dadba34e8c05325328cc1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1238/veryfront-linux-x64"
      sha256 "fff2eded915d92a4f6d5616211060b30f551ed9c552e6ffad883f90099263f05"
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
