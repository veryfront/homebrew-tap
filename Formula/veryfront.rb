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
  version "0.1.787"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.787/veryfront-macos-arm64"
      sha256 "c8dd49c4bee0dbc33520b97c884d9379c5595bbe7872cf8170b79f0c2b330102"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.787/veryfront-macos-x64"
      sha256 "de6da04ba1d14b2b574c49d63d3c552fa3e5f8635fcd9f93bff012f68f877fff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.787/veryfront-linux-arm64"
      sha256 "96355f056de5a74dc9dcd7184c3d237a8235206937db9e4d84b3ecdda61d344e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.787/veryfront-linux-x64"
      sha256 "2a2808b503ff9be0f22a7ef39bc9e1a8b5a19e5396e2f9869d4e0aa19c7fab03"
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
