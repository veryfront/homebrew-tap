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
  version "0.1.423"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.423/veryfront-macos-arm64"
      sha256 "c90fa453204582b9aff791ad4fc3c2a6c8352a8467fd14ac7e52d34b17934703"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.423/veryfront-macos-x64"
      sha256 "26913e74b954d300340f400ffa04cdcf386e494722876d24084066f91cef9856"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.423/veryfront-linux-arm64"
      sha256 "e3719afd6e4eb70b2f2297553440fdd48fc2e7fc7e3547b929d26d1b261c3fb1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.423/veryfront-linux-x64"
      sha256 "511ef6c4d38908864feee963cdb2b69d6a2735b8c15b339191f2a95924fa7c22"
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
