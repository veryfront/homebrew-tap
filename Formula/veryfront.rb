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
  version "0.1.511"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.511/veryfront-macos-arm64"
      sha256 "942d69452bfa31679c4d2233b7b892f205c7f0a7ad1bb7c200cd8ea3a9db8ebe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.511/veryfront-macos-x64"
      sha256 "8d57938498ff89c7b43deb4ea1068a812cac7c6b9955328c5cfa0be5050ad966"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.511/veryfront-linux-arm64"
      sha256 "c6f827d802d1146c8bda6fbbc5020a76b2732a48908eedf8384c69064bd9d412"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.511/veryfront-linux-x64"
      sha256 "ccdc2fb40a25dcb47154a9880bf956b0b69d35556030dd07f31e0dabad8c7ffe"
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
