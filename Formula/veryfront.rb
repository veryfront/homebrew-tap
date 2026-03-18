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
  version "0.1.73"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.73/veryfront-macos-arm64"
      sha256 "2a76e4e7b6a8ee59577794933e4d5ce160cdb4a15d92248127f35fecfab45384"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.73/veryfront-macos-x64"
      sha256 "0f9114f4d82548a632b8809d78e189e4932e6c48afdc52ed56e3b3cfa8aff9b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.73/veryfront-linux-arm64"
      sha256 "e75b84fa1b8625ef24f84c49cd9cb1dc66c2a186162491a0c57c2896862601ae"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.73/veryfront-linux-x64"
      sha256 "85a7a7d357cddbb36f0eaac038b85bc2796b9ed7c97624a259e4f3f9ef3d3cd8"
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
