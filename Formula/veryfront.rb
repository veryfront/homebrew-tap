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
  version "0.1.307"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.307/veryfront-macos-arm64"
      sha256 "355062d33dca059c760e55a142cd741ca545c6ecd1d14d256128f00041a7ef50"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.307/veryfront-macos-x64"
      sha256 "7aa7bfbcce8732aa92344db972fb18558feb24bb7421f6941afb52e5234147c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.307/veryfront-linux-arm64"
      sha256 "7a643a19436b392b35f9a61a6efdb010185cc6bd767a53eb4c2b0a912a99bbf3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.307/veryfront-linux-x64"
      sha256 "ef87ff2d968482b08dc5421d9202db551f44493d8c0e2016385ff55dc33c96c6"
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
