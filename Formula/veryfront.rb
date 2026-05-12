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
  version "0.1.505"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.505/veryfront-macos-arm64"
      sha256 "a38c58b8ff7c9138411fa9361344eb4640e277b5f9025f85349e7c0c03ac5fdf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.505/veryfront-macos-x64"
      sha256 "b61c0933ba666b65678a07c04608dfe17e696977bbed794442fed92583224fa2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.505/veryfront-linux-arm64"
      sha256 "077ccc71a2738bb1ff10be6a88b1558cb5f58949b78e3b0b0754ad59028e3888"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.505/veryfront-linux-x64"
      sha256 "295fbf1e65a14bae3e92a4333330fdb82ac2f27fd18c89761211b9c248cc044f"
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
