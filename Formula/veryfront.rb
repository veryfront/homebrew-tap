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
  version "0.1.1233"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1233/veryfront-macos-arm64"
      sha256 "71047bdb0fc8441fa0e5dd2eb9b82340eafd479eb57628309091379ad6794c8f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1233/veryfront-macos-x64"
      sha256 "9188c20694178b089a16e6e085b814128ad4974a5316606fd4e2f897ef4d7271"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1233/veryfront-linux-arm64"
      sha256 "452d4601262fe5481a1f62de5074bb1be548811ef58657753d54cb997318886b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1233/veryfront-linux-x64"
      sha256 "daa2d64c87a641421bc0b13db4dde3b1b10c08d7cf4ac980a200cedfd4817d1e"
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
