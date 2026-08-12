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
  version "0.1.1232"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1232/veryfront-macos-arm64"
      sha256 "7482048db319a98799f8d601ffd47c8f8eca72d32b8aab5e9173c778117b39dd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1232/veryfront-macos-x64"
      sha256 "14396431573134d212d553a2acb7b142500bfe160b22c42137c86a571db93e93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1232/veryfront-linux-arm64"
      sha256 "009e6b436ca4283c3d1603de6729007bc785faf1f0faab444f0f6dc44605c0d0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1232/veryfront-linux-x64"
      sha256 "45f3a324786e36d93fb735e428075cbc504687c04426ba05996573dd08c1653a"
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
