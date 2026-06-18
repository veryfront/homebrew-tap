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
  version "0.1.853"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.853/veryfront-macos-arm64"
      sha256 "e8a8e9380f90aca158d4f9bd5a3a5edc9e84821eb85f66e5d92b87314a4061b7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.853/veryfront-macos-x64"
      sha256 "51677a5e18a06ea1f2ea1be8d1e161d4a2f05eeee9a3d46af94cdb1c598fa58d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.853/veryfront-linux-arm64"
      sha256 "914d24d4ec2ffd721a4da7874c27addc9396e58442e9bf94fe57d41327327d3d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.853/veryfront-linux-x64"
      sha256 "b8e5fcdc63df1c82d9de93987d1a9657e8f1f9dd84b5f510b59118fb0fb7487c"
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
