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
  version "0.1.945"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.945/veryfront-macos-arm64"
      sha256 "a6bde4ceafe75a48083aea43ac387f268b844c14ed613e5dbc86053c7fc09157"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.945/veryfront-macos-x64"
      sha256 "51d1996f429aa7ef4e449d1012d122ceb0aef03e582cf15678b462aad44f9744"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.945/veryfront-linux-arm64"
      sha256 "a255dc7f4cde2ce85213c53c005e429db8b47641d764dd7ed502a8f6f7e5f267"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.945/veryfront-linux-x64"
      sha256 "751e14ea2748fab3cf22b55241c5eaf14abdb0f882120fbe2db6cf2bf0255e7a"
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
