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
  version "0.1.908"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.908/veryfront-macos-arm64"
      sha256 "e9b1601b69b842c81aecaf9abbf162e047b754d9ce0057b8bd03746ebaf8d3c8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.908/veryfront-macos-x64"
      sha256 "52813a2c6b9c3c89050eff80a4bfff9f87d7e91ca6e3bbc65b7ea90ae13c2d8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.908/veryfront-linux-arm64"
      sha256 "0eddf112857c20758b3062f52301eea8403150deec4dc055c2f2dda2547aa0dd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.908/veryfront-linux-x64"
      sha256 "eef87c8bc26fe4181f5539861c6fcc6de48fabe7a34b97cb371d23e456fc4a67"
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
