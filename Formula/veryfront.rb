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
  version "0.1.637"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.637/veryfront-macos-arm64"
      sha256 "4a8e00581ef842deb76822574dfa168680171afa1a3e2dc62ed37d86c4c71500"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.637/veryfront-macos-x64"
      sha256 "4e7d096fc2a5598a4afee7f6196a2f853effb766602a698dc540d31eeecedf5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.637/veryfront-linux-arm64"
      sha256 "28b5ace1f755bd370572b0a7808e2a5be637a9809df642f950e2964cb217f1be"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.637/veryfront-linux-x64"
      sha256 "9c4cf618e453e5271c2bada989aac18a4040b885c05a416f0aed2da05391f145"
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
