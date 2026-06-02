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
  version "0.1.634"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.634/veryfront-macos-arm64"
      sha256 "caedba0467cefa5648bc7a5e0faa2538c80978a3168598897ced491980079db5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.634/veryfront-macos-x64"
      sha256 "511ec2e586661f32b8a79a45c06f5e50b6281f1122c61f3e745bbeb35e942c14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.634/veryfront-linux-arm64"
      sha256 "31baaaf53e88ba137f245f0af45e469207d9f09b3ff1879bf18098960e753f1c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.634/veryfront-linux-x64"
      sha256 "244e0547e700b1ffd35024c677a35125f2784266f94f6ed24ac873dd665149e5"
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
