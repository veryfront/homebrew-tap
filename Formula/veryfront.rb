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
  version "0.1.699"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.699/veryfront-macos-arm64"
      sha256 "56e276e1af109a0079ea00d0c50874c47eaaf830a4cabdf1fd05aac1fe0cdd93"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.699/veryfront-macos-x64"
      sha256 "bb66cf83c60271385ba7b7a9511bbc2320236c0eed1dfc9b394fc5736a12be55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.699/veryfront-linux-arm64"
      sha256 "b1591b2172629416e6be0b8d4a361d3cd125c395cd9528fcb34c575117c6ccdf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.699/veryfront-linux-x64"
      sha256 "5d40bec13147c6c299bb5302ef5308c20bcb2dcc85b27d4930b9368b7927c00d"
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
