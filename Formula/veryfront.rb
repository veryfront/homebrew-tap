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
  version "0.1.387"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.387/veryfront-macos-arm64"
      sha256 "9cb2c45bb0f5ef02605985223e00c5261599d9d5b699dd30c46e6413558bca4a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.387/veryfront-macos-x64"
      sha256 "eacb6d252c9f2071c01014ed8aae601403408a47b2d6901f80c9f04a9661e5ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.387/veryfront-linux-arm64"
      sha256 "dc2315cc9d0cf252eeff69017de82ef0b95c949956aec56b2632db6dc4c72a00"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.387/veryfront-linux-x64"
      sha256 "a88b577bccbe4bba9a0aaccded9298a713b0b2d114de8069d364aa8e1840825d"
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
