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
  version "0.1.1197"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1197/veryfront-macos-arm64"
      sha256 "14121edf1687b4c2471592b5564f23782db4518cc8554bbf30786ff908c9bd25"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1197/veryfront-macos-x64"
      sha256 "82890119b521a2601844dd836cb9411c4604501d13ec3e8487cecb9c2d1ec6b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1197/veryfront-linux-arm64"
      sha256 "7ed92fde3e89076de3d7cb37ff912d65faf611e45e3d89c33cf635b504997971"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1197/veryfront-linux-x64"
      sha256 "6e002a9d4fd563a947878609d28b016b71d6faeff4403f558c79da4c3fb29091"
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
