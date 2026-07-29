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
  version "0.1.1176"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1176/veryfront-macos-arm64"
      sha256 "4b863833ce3babbef6605a09050c2e19a4c925558c357891816edf185620ea75"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1176/veryfront-macos-x64"
      sha256 "247f6c3fc6918407e5528ee2cb702efae1096ddfdc5180db9c0b549ba4dea2ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1176/veryfront-linux-arm64"
      sha256 "89d3c1d8e0e363f07f8f9ce1fb90095455ce469d1e628a5ae2508713189d8149"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1176/veryfront-linux-x64"
      sha256 "488a83cde29bad51678c07128f93040252816035e0952f8b330ff12b1a2b1a29"
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
