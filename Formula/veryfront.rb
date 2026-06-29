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
  version "0.1.972"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.972/veryfront-macos-arm64"
      sha256 "4dde9b02dfe0905d2fcf334a6f20b26a8efe4b84bf60a3797bee4fc91fb2e8d8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.972/veryfront-macos-x64"
      sha256 "82801218afb00e7818d30fa7676f4186448ba84e7eb55d152ceafae6e45f5ff5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.972/veryfront-linux-arm64"
      sha256 "fd7c6d6446af45118391cc768c18d8c04cc8aed2af885f7beb1a7541fd38c172"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.972/veryfront-linux-x64"
      sha256 "44f3b5eb7bc584879b07e20f1cc7455a7840867ec9c1a0a1caa738787fe96482"
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
