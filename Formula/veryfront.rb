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
  version "0.1.15"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.15/veryfront-macos-arm64"
      sha256 "e103da7cf3a50c7a90b28449cbdae913ab83046b0fc95228dc56bc41bae5cab1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.15/veryfront-macos-x64"
      sha256 "4d75ac30ae89fab1c04a8fdabf6158bb7113fe0cefe4b849455ccd271a7e9d3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.15/veryfront-linux-arm64"
      sha256 "6cabb6586bce2bbed98c2aa3d5b097d0981b561eea97ac16295ef7861af27241"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.15/veryfront-linux-x64"
      sha256 "a6683ed704ab5511f0cc724b01e64eb33f636695e54e638fc5b4101ef63173fa"
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
