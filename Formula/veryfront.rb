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
  version "0.1.668"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.668/veryfront-macos-arm64"
      sha256 "b3d5a0deebbd8e448c811ba21ecaed47e4eb0bb17004f060355139f36f383531"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.668/veryfront-macos-x64"
      sha256 "9f41a2af63fc0861462435d493dbfd6742e3c1efc07364e734902da9dd0894f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.668/veryfront-linux-arm64"
      sha256 "dfcd767902474c3e305d64f2a7ad4424ff29066d9c640904179185f5b0a341a1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.668/veryfront-linux-x64"
      sha256 "970aa4d388ba75d51e3380dcdf1c639e1f5d9a3b3ead4e0c735bf536663c7dc1"
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
