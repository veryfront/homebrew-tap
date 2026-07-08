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
  version "0.1.1026"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1026/veryfront-macos-arm64"
      sha256 "1afff4c4baf3e0ffa89d7e438eb14ae9dca0507cf3d77fb6c8eef963d54b076e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1026/veryfront-macos-x64"
      sha256 "6cd98b34d98904c5b6fe313e00644f861511d84de9efffb04a54e42ab616d993"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1026/veryfront-linux-arm64"
      sha256 "3c09a276b209486f40896acddeacb2aace3563729a4c379f93ad8bffd0198cc9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1026/veryfront-linux-x64"
      sha256 "4cda5c0e6aa0473ad415b648606b901d6aa01743b1d19fb4edf379488e4c9f0a"
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
