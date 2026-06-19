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
  version "0.1.871"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.871/veryfront-macos-arm64"
      sha256 "8e106057ad8b7894150dc40e226db5430c67899ab48289feb3ee57d8ab9a66ab"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.871/veryfront-macos-x64"
      sha256 "dc186c3d4a137117eb4d10b4c2961267077050430b5d6b119463f04afbd458ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.871/veryfront-linux-arm64"
      sha256 "520bd2dfacb4538a7d1629de2e81a8870ade53b6458a736e07df962964c6c228"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.871/veryfront-linux-x64"
      sha256 "95b37a491ff242edfbd65db53178641e469e8d3a10bc8a9fd7f366834aa53370"
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
