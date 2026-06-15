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
  version "0.1.810"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.810/veryfront-macos-arm64"
      sha256 "061340e6fca8615080e411d334ce1ec9305ac435c2242cb7469619ebb31a1c4e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.810/veryfront-macos-x64"
      sha256 "9dfdf4efb60f512172fa2e70ad0972fab65575c72a1401fdceef8c4b89495cc2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.810/veryfront-linux-arm64"
      sha256 "40a4406106c471a82af0c61c9150c6649fd207ffb3fbec3e64726dd01f757d04"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.810/veryfront-linux-x64"
      sha256 "0498bd1ead1a904376251cf12f5d332f6f473922bc64889cd189dd0cd0ac8408"
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
