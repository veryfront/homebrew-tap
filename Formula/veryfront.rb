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
  version "0.1.603"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.603/veryfront-macos-arm64"
      sha256 "1e462c0cbfe980248b9d618088c12ddda0a87ce45c1b1d1eab7d170d38630cbf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.603/veryfront-macos-x64"
      sha256 "f82acbcae1d251f511349b118cf9e7ee2c9635bb6ac957038f68ea927f0d0917"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.603/veryfront-linux-arm64"
      sha256 "fa48fe050687270da9f285ebc23301fef8b4280f5a741e9554af8e0db57a994b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.603/veryfront-linux-x64"
      sha256 "ed4be0e7376d6d8dfb4f644054cb86ac95d24713b2c7aec1c79bac053523de81"
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
