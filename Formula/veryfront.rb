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
  version "0.1.827"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.827/veryfront-macos-arm64"
      sha256 "db645b055ac8989044248066de6eb9f524242ec371e9d0af14d650360b865e83"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.827/veryfront-macos-x64"
      sha256 "34bf7c89c0b3b3ad6a4439b6353d38f0253e2bbc38ba9ed8c2712d666d1d8f16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.827/veryfront-linux-arm64"
      sha256 "ca86e21e9624570ee637f6ea850f47ce95d10cc8e0d88542bd0e4a4a5efde64c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.827/veryfront-linux-x64"
      sha256 "827516c2880cb351fd60042fba8373fc87e04167d4755011d49b52b423e41fea"
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
