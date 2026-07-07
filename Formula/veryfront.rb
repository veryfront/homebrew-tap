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
  version "0.1.1024"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1024/veryfront-macos-arm64"
      sha256 "873cf032f21b3202f95eedc3893b8cca98a34e1541de934b502d203381ff0a3a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1024/veryfront-macos-x64"
      sha256 "18703d761f6f3dc55adbe5cd8d740c2be62abb94aaf6b3904c464b0e3d5a8343"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1024/veryfront-linux-arm64"
      sha256 "298d039d236116043f946e1be5e42b0182814c08eea94f970567317d87012a47"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1024/veryfront-linux-x64"
      sha256 "8076009b90a35a6ba6573cd26570e47ed527d4040b9fc6151b6b9087ac40151d"
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
