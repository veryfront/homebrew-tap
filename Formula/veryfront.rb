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
  version "0.1.306"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.306/veryfront-macos-arm64"
      sha256 "b511b9dd842a1b95e852fabc6ecd6c03a535bff8029357c08457323780146609"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.306/veryfront-macos-x64"
      sha256 "21330089a297b5346e43d0187fe656481de48de2b93fff46c40c38dc390ee2ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.306/veryfront-linux-arm64"
      sha256 "76513931fc0d6d432f915ea82342d1c32a4a77e37342afbff57c64ddc076a6c7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.306/veryfront-linux-x64"
      sha256 "61b52f87ec20db1e506a08e32e54106712b6ccde24cf91b40d0b275917a709f5"
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
