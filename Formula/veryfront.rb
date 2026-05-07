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
  version "0.1.405"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.405/veryfront-macos-arm64"
      sha256 "1900166d812bb1c2cd0d70c6c689742721ab9e73dda83e5ee235c196266cf466"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.405/veryfront-macos-x64"
      sha256 "9248bb6a4461f42f180b25b473572436c5908cc68b6c51dc29b654ee3d06c718"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.405/veryfront-linux-arm64"
      sha256 "cb2a3112f4e437bce2c464b0c4c3a70ea6e9a31f855dff5292ce4b2e25be95e7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.405/veryfront-linux-x64"
      sha256 "4af9e22faea74241fd0e9fcb44d4d655a369b4943fbd66f659608a697db6efd2"
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
