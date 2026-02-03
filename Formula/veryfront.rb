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
  version "0.1.7-rc.44"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.7-rc.44/veryfront-macos-arm64"
      sha256 "6a362770c257f6eff8df2dd5079a9b15a6bddae4019ec65acf2a0cfb495b35fb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.7-rc.44/veryfront-macos-x64"
      sha256 "7366bc15da28042bd8df9b9ab08bbf4914ecc2c1e924ec4c94d0c4fc1041c6e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.7-rc.44/veryfront-linux-arm64"
      sha256 "cb6092992d89acd282481316ff69f1ff9a14d3379e42fb90444f17227e73aa77"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.7-rc.44/veryfront-linux-x64"
      sha256 "bba8714a23b3ea10fe06b4da345c257a25b814066bb9c245cf892d6b261ed648"
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
