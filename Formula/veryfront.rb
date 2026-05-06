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
  version "0.1.403"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.403/veryfront-macos-arm64"
      sha256 "008ab45cab8516e7973a18a95385ba2f96b7647d51e9a3fde172a810cc0aba0c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.403/veryfront-macos-x64"
      sha256 "074468801f9135ad91324b2ed57a736d3926f0b1e126c6505f826d93cc4fa3c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.403/veryfront-linux-arm64"
      sha256 "ae86395253629849d416d30b15602549751927249759116665cd71aaad8c9eed"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.403/veryfront-linux-x64"
      sha256 "ac0d2e8f84feb010ce9618b1d5c90ca42b472c2cb242a163874b9c92c3c96ad0"
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
