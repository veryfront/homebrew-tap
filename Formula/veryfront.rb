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
  version "0.1.1167"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1167/veryfront-macos-arm64"
      sha256 "83f0792e8b764e724f7d9d8302bad64e1fc4621da4a2d7428dc0217aa70d5fbc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1167/veryfront-macos-x64"
      sha256 "f00e57c4edb4bde844953939a86fd5f3835d6fdb1f0120d10fc0c264163cdfc7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1167/veryfront-linux-arm64"
      sha256 "44512a138c3636839ef6c44c3c455b1d0b54f8b693d5ab41568c939a15296b4a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1167/veryfront-linux-x64"
      sha256 "100dc4abe871db8c8847230c56638aa7d54c4bead5605613c6f483a09bf5d776"
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
