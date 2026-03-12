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
  version "0.1.60"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.60/veryfront-macos-arm64"
      sha256 "aa9c572a7df4fdbd4fe8c51381147315aca0d795f62d33395cb1921266a7a2ac"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.60/veryfront-macos-x64"
      sha256 "1fb53231f0876ee55baa8a4bb16a053a9494e67d6e7ceaa9fa3b652844ba1fd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.60/veryfront-linux-arm64"
      sha256 "f886504452dee171a58e00afeded0e9652b06ab13975c32f2fcc66f40353aec0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.60/veryfront-linux-x64"
      sha256 "4bcd191d1fe360a71875bdcf7149ce1dbab31ebe4a995cbb4b3f4ae47414df4c"
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
