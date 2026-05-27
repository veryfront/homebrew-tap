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
  version "0.1.597"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.597/veryfront-macos-arm64"
      sha256 "eb62562c933802ab87134a1fe8d508ee41a1388476f39f8ed727ed87d1ae96d8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.597/veryfront-macos-x64"
      sha256 "a76942f815c36815d8c4b8f025e954b1e016b64b142974df7b86117236eeb51d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.597/veryfront-linux-arm64"
      sha256 "c148c7ee5405c78623329051de2566bd1e3427d1c3fc8fe0d983c108fe8b682b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.597/veryfront-linux-x64"
      sha256 "033542f260dff799dbdfcef21e96f9ae509cb5021260943fbcff0a0d752159dc"
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
