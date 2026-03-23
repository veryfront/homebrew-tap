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
  version "0.1.99"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.99/veryfront-macos-arm64"
      sha256 "25358006ae66e38e4474e0176b5891f77f6202162d43b4a25296a37de32c23fd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.99/veryfront-macos-x64"
      sha256 "a9cd52aa466930897922ba10e64cbece5e78a1923f1ede22d1c78228cd1eecb9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.99/veryfront-linux-arm64"
      sha256 "d90a04b80e05e5150b7dba4762efe143fb675bf656d32d0c4c3751f3431f7725"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.99/veryfront-linux-x64"
      sha256 "d76896434b45c3b8a9fe5e6c227e63512c6e78e8309ef9f0186603b2a7649b52"
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
