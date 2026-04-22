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
  version "0.1.241"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.241/veryfront-macos-arm64"
      sha256 "6159c1b12585ee80b9e980756c27769679bc4007d4f72305335f5f69eb03e95d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.241/veryfront-macos-x64"
      sha256 "dbc7eb76ecb6e593a013aaf58752b7c2e92198c941db658c889640910292301d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.241/veryfront-linux-arm64"
      sha256 "1a7fb718a74fc0eadc8516e75bac75995dc9c7666bf8cd3e4389952d15249c8c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.241/veryfront-linux-x64"
      sha256 "9f7460490fb49d686f4936b2aff10a3764cba1b3f0109b907a7866e12079ed90"
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
