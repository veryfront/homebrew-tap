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
  version "0.1.780"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.780/veryfront-macos-arm64"
      sha256 "963621a430616b2a61759f892fae2afeceeb5450dab8634bbbb1a48b41b8d26f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.780/veryfront-macos-x64"
      sha256 "f835493a0d07483e4a7ea8063eb35c933a6bcad03067de99d24c9eb052fafc25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.780/veryfront-linux-arm64"
      sha256 "da9840800dcc8d44ad162160c12924d4fd54023c810fa5eec5c377223e042edf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.780/veryfront-linux-x64"
      sha256 "06797f4ffdf84c31129fa583312de9a711c6759f82b5f39dd341983bb6f38045"
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
