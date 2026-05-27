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
  version "0.1.601"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.601/veryfront-macos-arm64"
      sha256 "66ee7b39f26ced52673143b357dfcb37ae9d4e84e015811fbd97703800e18bfd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.601/veryfront-macos-x64"
      sha256 "de825cdec8dac49576a1c0c806821f3f74bfa8cb99aca68f99f1b31cd3275569"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.601/veryfront-linux-arm64"
      sha256 "530bf421662ce78d4734cafbbe4d987b6aa6e06dc583afc488d51d588ac864e9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.601/veryfront-linux-x64"
      sha256 "ae730bcee5d3e54ea3b36b07a322cb6d3b4d766ce17ea07d79b292b58cb0b41e"
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
