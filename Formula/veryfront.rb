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
  version "0.1.493"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.493/veryfront-macos-arm64"
      sha256 "26c350c4a96c5c75e757893ae500e4279deea4ad60b903b9b9b539a0458c895d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.493/veryfront-macos-x64"
      sha256 "a06a0f4578d3da708938553e1e555ffe1429cdddc534e6c1939da7d19a4b27da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.493/veryfront-linux-arm64"
      sha256 "3c7820269c5bccbe85588700de24e1559be52e6c00aa9caec403ff60ed3136fb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.493/veryfront-linux-x64"
      sha256 "51c4364518c400b77abaf72b033b415db0096ae747ffdbe9cfca4c4e4b119fe6"
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
