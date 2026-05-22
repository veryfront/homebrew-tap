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
  version "0.1.577"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.577/veryfront-macos-arm64"
      sha256 "d33e0e6a2fe94a1ddbe67abebb68c10da7320b2425e719f92df760ae8e3bdfb9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.577/veryfront-macos-x64"
      sha256 "9410e4516fb8373db13b586bc47f3b4247a1e96e0f2f68331b62df6af351cbbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.577/veryfront-linux-arm64"
      sha256 "4ebbcfdedc6792239d2a3e03c3f1fdadf522f117af870afbaf0b6989fce8c232"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.577/veryfront-linux-x64"
      sha256 "b0bbf66f3e5eacb6e3d5f2381184ee384655a2da919ebdfc9ac16c52bfff7465"
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
