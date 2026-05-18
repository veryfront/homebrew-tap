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
  version "0.1.555"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.555/veryfront-macos-arm64"
      sha256 "3f2861ef0f7ea956ecd4ad6a87560e52d6b9e4776f39de716d0ea44ee8123d66"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.555/veryfront-macos-x64"
      sha256 "c238f36f06533037153b4ab2cf4fc3a8c2a7723a67f1387d44800469ec2bb6aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.555/veryfront-linux-arm64"
      sha256 "8e11b9a4edf131857204eabf8ba7f97c80ff806253c756e5df97cc0fd5a3eb00"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.555/veryfront-linux-x64"
      sha256 "6e68100cde75238a247b53c30eded787829209e9a1d467e48ad5af720b16c5ed"
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
