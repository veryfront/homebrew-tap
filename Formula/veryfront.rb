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
  version "0.1.364"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.364/veryfront-macos-arm64"
      sha256 "aac547b2e7402f2c5df9e11b73988b3a932f07085d09c9e6c382b87b1108a437"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.364/veryfront-macos-x64"
      sha256 "436ac86dc56dacfb256b148b7cc5f49ec6845692295f206cd4ae6f008bcd2ba2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.364/veryfront-linux-arm64"
      sha256 "704a2fd0f7a3b4c02a7f068f29a478c16f3a64b4e3166ff05708a721f414ab21"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.364/veryfront-linux-x64"
      sha256 "fb302bace7f97295f50a1eeb1372425f1125abf55f10343e1246411376a529a8"
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
