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
  version "0.1.465"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.465/veryfront-macos-arm64"
      sha256 "48f11ef3be53bcca3098438228dd4c03829e7cf65471bda0d4da600c1beb5755"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.465/veryfront-macos-x64"
      sha256 "d6ea5a70456522208db124dd401fc8253ef27b2aebc9219aca040235f2fed86d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.465/veryfront-linux-arm64"
      sha256 "a0176c1c11d9ad43b3cda2c16c1356ccbff7e3161184f0b9893ab36335936abb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.465/veryfront-linux-x64"
      sha256 "1632b61969d03acd46fc547ef0b509b6c0e0056c85f40fcdc4f51fdef6de9c32"
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
